(cl:in-package #:iconoclast-ast-transformations)

;;; This file will contain code for inlining local functions defined
;;; by LABELS-ASTs.

;;; To understand the following discussion, recall that local
;;; functions introduced by LABELS are the one constructs that can
;;; introduce new lexical variables, and that all lambda-list
;;; variables are lexical.  We have reduced all other
;;; variable-introducing constructs to LABELS, so there are no
;;; instances of LET, LET*, FLET, or LAMBDA.

;;; We say that a local function ESCAPES, if it is still accessible
;;; after the function that created it (the parent function) exits.
;;; We will use a conservative approximation of ESCAPES.  See separate
;;; component for computing escaped functions.

;;; We say that a variable introduced by some function is CAPTURED if
;;; it is shared by some other function that escapes.

;;; The lexical environment created by some function F can be shared
;;; by its parent function G, provided:
;;;
;;;   * F does not escape,
;;;
;;;   * F is not recursive (directly or indirectly).
;;;
;;;   * No variable introduced by F is captured.

;;; To illustrate this idea, we use the following examples:
;;;
;;; (defun aa ()
;;;   (labels ((ff (y)
;;;              (labels ((gg (x)
;;;                         (if (zerop x) y (* x (gg (1- x))))))
;;;                (gg y))))
;;;     (loop for i from 0 to 5
;;;           collect (ff i))))
;;;
;;; (aa) => (0 1 4 18 96 600)

;;; In function AA, FF does not escape, is not recursive, and Y is not
;;; captured.  Therefore, we can create Y as part of AA like this:

;;; (defun bb (y)
;;;   (labels ((gg (x)
;;;              (if (zerop x) y (* x (gg (1- x))))))
;;;     (loop for i from 0 to 5
;;;           do (setq y i)
;;;           collect (gg y))))
;;;
;;; (bb nil) => (0 1 4 18 96 600)

;;; We can't illustrate using LET inside BB because LET has the same
;;; power to introduce variables as LET does, so we have BB introduce
;;; Y and we use SETQ on it instead.

;;; However, in this example:

;;; (defun cc ()
;;;   (labels ((ff (y)
;;;              (labels ((gg (x)
;;;                         (if (zerop x) y (* x (gg (1- x))))))
;;;                (lambda () (gg y)))))
;;;     (loop for i from 0 to 5
;;;           collect (ff i))))
;;;
;;; (mapcar #'funcall (cc) => (0 1 4 18 96 600)

;;; The function GG escapes, so Y is captured.  Therefore, if we
;;; attempt to allocate Y as part of CC, we will fail:

;;; (defun dd (y)
;;;   (labels ((gg (x)
;;;              (if (zerop x) y (* x (gg (1- x))))))
;;;     (loop for i from 0 to 5
;;;           do (setq y i)
;;;           collect (lambda () (gg y)))))
;;;
;;; (mapcar #'funcall (dd nil) => (600 600 600 600 600 600)

;;; When the environment introduced by some function can be shared by
;;; its parent, the function can be inlined.  But we have no way of
;;; expressing this idea other than using LET in the parent function,
;;; which is not really inlining in the sense we use it here, since
;;; LET is just a different way of doing something similar to LABELS.
;;; And we can't modify the signature of the parent function either,
;;; the way we did in function BB and DD above.  So we use a different
;;; AST type, LET-TEMPORARY to express this idea.  The equivalent of
;;; inlining GG in BB above in pseudo source code would look like this:

;;; (defun bb ()
;;;   (labels ((gg (x)
;;;              (if (zerop x) y (* x (gg (1- x))))))
;;;     (loop for i from 0 to 5
;;;           collect (let-temporary (y i)
;;;                     (gg y)))))
;;;
;;; (bb) => (0 1 4 18 96 600)

;;; In addition to the requirements above, we put the following
;;; restrictions on inlining:
;;;
;;;   * We approximate the ESCAPE criterion by requiring the name of
;;;     the function to appear only in the operator position of an
;;;     application for it not to escape.
;;;
;;;   * It must be called from one single call site.  We might relax
;;;     this criterion later when we have a better idea of the
;;;     increased code size that inlining would create.
;;;
;;;   * It must be called from the same function that defines it.  The
;;;     reason for this criterion is that if it closes over some
;;;     variable, and it is called by some inner function, then more
;;;     functions might close over the variable.  We might relax this
;;;     criterion later if the candidate for inlining does not close
;;;     over any variables.
;;;
;;;   * Every lambda-list parameter must be required.

;;; This function returns true if and only if some LOCAL-FUNCTION-AST
;;; is recursive, directly or indirectly.
(defun function-is-recursive-p (local-function-ast ast-info)
  (let ((visited (make-hash-table :test #'eq)))
    (labels
        ((aux (new-function-ast)
           (cond ((gethash new-function-ast visited)
                  nil)
                 (t
                  (setf (gethash new-function-ast visited) t)
                  (loop for caller-ast
                          in (function-caller-asts
                              new-function-ast ast-info)
                            thereis (or (eq caller-ast local-function-ast)
                                        (aux caller-ast)))))))
      (aux local-function-ast))))

;;; This function returns the number of call sites of some
;;; LOCAL-FUNCTION-AST.
(defun number-of-call-sites (local-function-ast)
  (let* ((name-ast (ico:name-ast local-function-ast))
         (reference-asts (ico:reference-asts name-ast)))
    (length reference-asts)))

;;; This function returns true if and only if the lambda list of the
;;; function represented by LOCAL-FUNCTION-AST contains only required
;;; parameters.  We don't check the AUX section because the lambda
;;; list has been lexified already.
(defun only-required-parameters (local-function-ast)
  (let ((lambda-list-ast (ico:lambda-list-ast local-function-ast)))
    (and (null (ico:optional-section-ast lambda-list-ast))
         (null (ico:rest-section-ast lambda-list-ast))
         (null (ico:key-section-ast lambda-list-ast)))))

;;; This function return true if and only if the function represented
;;; by LOCAL-FUNCTION-AST can be inlined.
(defun function-can-be-inlined-p (local-function-ast ast-info)
  (and (not (function-escapes-p local-function-ast ast-info))
       (not (function-is-recursive-p local-function-ast ast-info))
       (only-required-parameters local-function-ast)
       (not (some-variable-escapes
             (ico:lambda-list-ast local-function-ast) ast-info))
       (= 1 (number-of-call-sites local-function-ast))))

(defclass inlinable-functions-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)
   (%local-function-asts :initform '() :accessor local-function-asts)))

(defmethod iaw:walk-ast-node :around
    ((client inlinable-functions-client) (ast ico:local-function-ast))
  (call-next-method)
  (when (function-can-be-inlined-p ast (ast-info client))
    (push ast (local-function-asts client)))
  ast)

(defun inlinable-functions (ast ast-info)
  (let ((client (make-instance 'inlinable-functions-client
                  :ast-info ast-info)))
    (iaw:walk-ast client ast)
    (local-function-asts client)))

;;; The current way we inline a function is that we take the ASTs in
;;; the lambda list and the body, and we generate LET-TEMPORARY-ASTs
;;; using the lambda-list entries and we wrap the body in a
;;; LOCALLY-AST in case there are declarations in the body.  However,
;;; this way works only if we inline a single site.  If we were to
;;; inline several sites, we would have some ASTs shared, and, with
;;; few exceptions, the AST is supposed to be a tree.  We also cannot
;;; simply clone the AST, because references to lexical variables in
;;; an outer scope can't just be cloned; they have to be added to the
;;; list of VARIABLE-REFERENCE-ASTs that is in the
;;; VARIABLE-DEFINITION-AST.  Furthermore, since the body ASTs can not
;;; be shared, we must delete the original function AST when we
;;; inline.  We do this by removing it from its parent LABELS-AST.
;;;
;;; A better way would be to clone the AST but to make sure we
;;; carefully add variable references to their respective definitions.

(defun create-let-temporary-asts
    (variable-definition-asts form-asts locally-ast)
  (if (null variable-definition-asts)
      locally-ast
      (make-instance 'ico:let-temporary-ast
        :binding-ast
        (make-instance 'ico:variable-binding-ast
          :variable-name-ast (first variable-definition-asts)
          :form-ast (first form-asts))
        :form-asts (list (create-let-temporary-asts
                          (rest variable-definition-asts)
                          (rest form-asts)
                          locally-ast)))))

(defun replace-call-site (local-function-ast reference-ast ast-info)
  (let* ((application-ast (parent-ast reference-ast ast-info))
         (name-ast (ico:name-ast local-function-ast))
         (lambda-list-ast (ico:lambda-list-ast local-function-ast))
         (required-section-ast (ico:required-section-ast lambda-list-ast))
         (required-parameter-asts
           (if (null required-section-ast)
               '()
               (ico:parameter-asts required-section-ast)))
         (variable-definition-asts
           (mapcar #'ico:name-ast required-parameter-asts)))
    (check-type application-ast ico:application-ast)
    (let ((function-name-ast (ico:function-name-ast application-ast))
          (argument-asts (ico:argument-asts application-ast)))
      (assert (= (length required-parameter-asts) (length argument-asts)))
      (assert (eq (ico:definition-ast function-name-ast)
                  name-ast))
      (let ((locally-ast
              (make-instance 'ico:locally-ast
                :origin (ico:origin local-function-ast)
                :declaration-asts (ico:declaration-asts local-function-ast)
                :form-asts (ico:form-asts local-function-ast))))
        (change-class application-ast
                      'ico:progn-ast
                      :form-asts (list (create-let-temporary-asts
                                        variable-definition-asts
                                        argument-asts
                                        locally-ast)))))))

(defun inline-function (local-function-ast ast-info)
  (let* ((name-definition-ast (ico:name-ast local-function-ast))
         (reference-asts
           (ico:reference-asts name-definition-ast)))
    ;; Replace each call site with the body of the function.
    (loop for reference-ast in reference-asts
          do (replace-call-site local-function-ast reference-ast ast-info))
    ;; Remove the LOCAL-FUNCTION-AST from the binding of its parent
    ;; LABELS-AST.
    (let ((labels-ast (parent-ast local-function-ast ast-info)))
      (check-type labels-ast ico:labels-ast)
      (let* ((binding-asts (ico:binding-asts labels-ast))
             (new-binding-asts (remove local-function-ast binding-asts)))
        (reinitialize-instance labels-ast
          :binding-asts new-binding-asts)))))

(defun inline-functions (local-function-asts ast-info)
  (loop for local-function-ast in local-function-asts
        do (inline-function local-function-ast ast-info)))

(defun inline-inlinable-functions (ast)
  (let* ((ast-info (compute-ast-info ast))
         (inlinable-functions (inlinable-functions ast ast-info)))
    (inline-functions inlinable-functions ast-info))
  ast)

; LocalWords:  inlining
