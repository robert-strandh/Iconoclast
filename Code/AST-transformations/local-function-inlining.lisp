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
(defun function-is-recursive-p (local-function-ast call-graph)
  (let ((node (gethash local-function-ast (node-table call-graph)))
        (visited (make-hash-table :test #'eq)))
    (labels ((aux (new-node)
               (cond ((gethash new-node visited)
                      nil)
                     (t
                      (setf (gethash new-node visited) t)
                      (loop for caller-node in (caller-nodes new-node)
                              thereis (or (eq caller-node node)
                                          (aux caller-node)))))))
      (aux node))))

;;; This function returns the number of call sites of some
;;; LOCAL-FUNCTION-AST.
(defun number-of-call-sites (local-function-ast call-graph)
  (let ((node (gethash local-function-ast (node-table call-graph))))
    (length (caller-nodes node))))

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
(defun function-can-be-inlined-p
    (local-function-ast
     ast-owners
     function-tree
     escaped-functions
     call-graph)
  (and (not (function-escapes-p local-function-ast escaped-functions))
       (not (function-is-recursive-p local-function-ast call-graph))
       (only-required-parameters local-function-ast)
       (not (some-variable-escapes
             (ico:lambda-list-ast local-function-ast)
             ast-owners
             function-tree
             escaped-functions))
       (= 1 (number-of-call-sites local-function-ast call-graph))))

(defclass inlinable-functions-client (client)
  ((%local-function-asts :initform '() :accessor local-function-asts)))

(defvar *ast-owners*)

(defvar *function-tree*)

(defvar *escaped-functions*)

(defvar  *call-graph*)

(defmethod iaw:walk-ast-node :around
    ((client inlinable-functions-client) (ast ico:local-function-ast))
  (call-next-method)
  (when (function-can-be-inlined-p
         ast  *ast-owners* *function-tree* *escaped-functions* *call-graph*)
    (push ast (local-function-asts client)))
  ast)

(defun inlinable-functions (ast)
  (let ((*ast-owners* (compute-owners ast))
        (*function-tree* (compute-function-tree ast))
        (*escaped-functions* (compute-escaped-functions ast))
        (*call-graph* (compute-call-graph ast))
        (client (make-instance 'inlinable-functions-client)))
    (iaw:walk-ast client ast)
    (local-function-asts client)))

(defun replace-call-site (local-function-ast reference-ast)
  (let* ((application-ast (parent reference-ast *parents*))
         (lambda-list-ast (ico:lambda-list-ast local-function-ast))
         (required-section-ast (ico:required-section-ast lambda-list-ast))
         (required-parameter-asts
           (if (null required-section-ast)
               '()
               (ico:parameter-asts required-section-ast))))
    (check-type application-ast ico:application-ast)
    (let ((function-name-ast (ico:function-name-ast application-ast))
          (argument-asts (ico:argument-asts application-ast)))
      (assert (= (length required-parameter-asts) (length argument-asts)))
      )))

(defun inline-function (local-function-ast)
  (let* ((name-definition-ast (ico:name-ast local-function-ast))
         (reference-asts
           (ico:local-function-name-reference-asts name-definition-ast)))
    ;; Replace each call site with the body of the function.
    (loop for reference-ast in reference-asts
          do (replace-call-site local-function-ast reference-ast))))

(defun inline-inlinable-functions (ast)
  (let ((inlinable-functions (inlinable-functions ast))
        (*parents* (compute-parents ast)))
    (loop for inlinable-function in inlinable-functions
          do (inline-function inlinable-function))))

; LocalWords:  inlining
