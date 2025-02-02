(cl:in-package #:iconoclast-ast-transformations)

;;; This file will contain code for closure conversion.
;;;
;;; When closure conversion is computed, we have already done
;;; assignment conversion where required.  Assignment conversion is
;;; done by the ASSIGNMENT-CONVERSION function.  We have also
;;; converted all references to local functions, TAGBODY tags, and
;;; BLOCKs to variable references.  So we just need to handle variable
;;; references with no assignments.
;;;
;;; We maintain a list, say L, of entries, where each entry represents
;;; a local function with a non-NIL static environment.  Each entry
;;; contains a LOCAL-FUNCTION-AST, the associated LET-TEMPORARY-AST
;;; extracting the static environment and the
;;; SET-STATIC-ENVIRONMENT-AST setting the static environment.
;;; Initially, that list is empty.

(defclass closure-entry ()
  ((%local-function-ast
    :initarg :local-function-ast
    :reader local-function-ast)
   (%let-temporary-ast
    :initarg :let-temporary-ast
    :reader let-temporary-ast)
   (%set-static-environment-ast
    :initarg :set-static-environment-ast
    :reader set-static-environment-ast)))

(defparameter *true-closure-entries* '())

;;; Take a VARIABLE-DEFINITION-AST and a VARIABLE-REFERENCE-AST and
;;; add the VARIABLE-REFERENCE-AST to the list of
;;; VARIABLE-REFERENCE-ASTs of the VARIABLE-DEFINITION-AST.
(defun link (definition-ast variable-reference-ast)
  (reinitialize-instance variable-reference-ast
    :definition-ast definition-ast)
  (reinitialize-instance definition-ast
    :reference-asts
    (cons variable-reference-ast
          (ico:reference-asts definition-ast))))

;;; WRAPPER-AST and WRAPPEE-AST are both ASTs that have a list of
;;; FORM-ASTs that can be accesses using ICO:FORM-ASTS, and that can
;;; be reinitialized using the :FORM-ASTS keyword.  We wrap the
;;; FORM-ASTs of WRAPPEE-AST in the WRAPPER-AST so that the new
;;; FORM-ASTs of WRAPPER-AST become the old forms of WRAPPEE-AST and
;;; the new FORM-ASTs of the WRAPPEE-AST become the singleton list
;;; containing the WRAPPER-AST.
(defun wrap-form-asts (wrapper-ast wrappee-ast)
  (reinitialize-instance wrapper-ast
    :form-asts (ico:form-asts wrappee-ast))
  (reinitialize-instance wrappee-ast
    :form-asts (list wrapper-ast)))

(defun ensure-closure-entry (local-function-ast ast-info)
  (let ((entry (find local-function-ast *true-closure-entries*
                     :key #'local-function-ast
                     :test #'eq)))
    (if (null entry)
        (let* (;; The STATIC-ENVIRONMENT-AST that will wrap the
               ;; FORM-ASTs of the body of the LOCAL-FUNCTION-AST.
               (static-environment-ast
                 (make-instance 'ico:static-environment-ast))
               ;; The VARIABLE-DEFINITION-AST of the variable holding
               ;; the static environment of the LOCAL-FUNCTION-AST.
               (static-entry-variable-definition-ast
                 (make-instance 'ico:variable-definition-ast
                   :name 'static-entry))
               ;; The BINDING-AST of the new LET-TEMPORARY-AST to be
               ;; used to wrap the FORM-ASTs of the body of
               ;; LOCAL-FUNCTION-AST.
               (binding-ast
                 (make-instance 'ico:variable-binding-ast
                   :variable-name-ast static-entry-variable-definition-ast
                   :form-ast static-environment-ast))
               ;; The new LET-TEMPORARY-AST to be used to wrap the
               ;; FORM-ASTs of the body of LOCAL-FUNCTION-AST.
               (let-temporary-ast
                 (make-instance 'ico:let-temporary-ast
                   :binding-ast binding-ast))
               ;; The SET-STATIC-ENVIRONMENT-AST will have a reference
               ;; to the VARIABLE-DEFINITION-AST of
               ;; LOCAL-FUNCTION-AST, so we need to create a new
               ;; VARIABLE-REFERENCE-AST and link them up.
               (variable-definition-for-function-ast
                 (ico:name-ast local-function-ast))
               (variable-reference-for-function-ast
                 (make-instance 'ico:variable-reference-ast
                   :name (ico:name variable-definition-for-function-ast)
                   :definition-ast
                   variable-definition-for-function-ast))
               ;; Presumably the LABELS-AST that contains the
               ;; definition of the LOCAL-FUNCTION-AST we are
               ;; processing.
               (labels-ast
                 (parent-ast local-function-ast ast-info))
               (set-static-environment-ast
                 (make-instance 'ico:set-static-environment-ast
                   :function-reference-ast
                   variable-reference-for-function-ast
                   :form-asts '()))
               (entry
                 (make-instance 'closure-entry
                   :set-static-environment-ast set-static-environment-ast
                   :local-function-ast local-function-ast
                   :let-temporary-ast let-temporary-ast)))
          (check-type labels-ast ico:labels-ast)
          (setf (owner-ast static-environment-ast ast-info)
                local-function-ast)
          (setf (owner-ast static-entry-variable-definition-ast ast-info)
                local-function-ast)
          (setf (owner-ast binding-ast ast-info)
                local-function-ast)
          (setf (owner-ast let-temporary-ast ast-info)
                local-function-ast)
          (setf (owner-ast variable-reference-for-function-ast ast-info)
                (owner-ast labels-ast ast-info))
          (setf (owner-ast set-static-environment-ast ast-info)
                (owner-ast labels-ast ast-info))
          (link variable-definition-for-function-ast
                variable-reference-for-function-ast)
          (wrap-form-asts let-temporary-ast local-function-ast)
          ;; Add the new SET-STATIC-ENVIRONMENT-AST as the first
          ;; FORM-AST in the body of the LABEL-AST.
          (reinitialize-instance labels-ast
            :form-asts (cons set-static-environment-ast
                             (ico:form-asts labels-ast)))
          ;; Add the new entry to the list and return the entry.
          (push entry *true-closure-entries*)
          entry)
        entry)))

;;; We make use of ownership of definitions and references of lexical
;;; variables.  When a definition and a reference of some lexical
;;; variable have different ownerships, we have a closed-over
;;; variable.  We also make use of a tree of functions.  The tree
;;; reflects nesting.  Ownership and the function tree are computed by
;;; COMPUTE-AST-INFO and
;;;
;;; We handle each shared variable separately.  For each shared
;;; variable, we have the function that defines it, functions that
;;; references it, and perhaps some intermediate functions that
;;; neither define nor reference it.  We consider the list of entries,
;;; say E, where an entry is either a variable definition or a
;;; variable reference.
;;;
;;;   1. If every entry in E has the same owner, stop.
;;;
;;;   2. Consider the owners F1, F2, ... Fn of each entry.  Use the
;;;      function tree to find the innermost function Fi of those
;;;      owners.
;;;
;;;   3. Extract all entries (which are necessarily variable reference
;;;      entries) with Fi as their owner, say R1, R2, ... Rk, and
;;;      remove them from E.
;;;
;;;   4. If Fi is not in L then wrap the body FORM-ASTs of Fi in a new
;;;      LET-TEMPORARY-AST with a STATIC-ENVIRONMENT-AST as the
;;;      FORM-AST and a new VARIABLE-DEFINITION-AST, say S.  Add a
;;;      SET-STATIC-ENVIRONMENT-AST to the beginning of the body of
;;;      the LABELS-AST that defines Fi.  Add Fi to L with the
;;;      associated LET-TEMPORARY-AST and SET-STATIC-ENVIRONMENT-AST.
;;;      Call the LET-TEMPORARY-AST associated with Fi LFi and the
;;;      SET-STATIC-ENVIRONMENT-AST associated with Fi SFi
;;;
;;;   5. Let Fj be the parent of Fi in the function tree.  Create a
;;;      new VARIABLE-REFERENCE-AST, say R, with Fj as the owner, and
;;;      add it to E.  Add R to SFi.
;;;
;;;   6. Create a new VARIABLE-DEFINITION-AST, say D.  Wrap the body
;;;      FORM-ASTs of LFi in a new LET-TEMPORARY-AST.  The new
;;;      LET-TEMPORARY-AST contains a READ-STATIC-ENVIRONMENT-AST as
;;;      the FORM-AST and D as the VARIABLE-DEFINITION-AST.  Link up D
;;;      and R1, R2, ... Rk.
;;;
;;;   7. Go to 1.

(defun function-is-an-ancestor-of-function-p
    (putative-ancestor-function-ast function-ast ast-info)
  (if (eq putative-ancestor-function-ast function-ast)
      ;; We consider only proper ancestors.
      nil
      (loop for ancestor-ast = function-ast
              then (function-parent-ast ancestor-ast ast-info)
            when (eq ancestor-ast putative-ancestor-function-ast)
              return t
            until (null ancestor-ast)
            finally (return nil))))

(defun function-ast-is-the-ancestor-of-none-in-set
    (function-ast function-asts ast-info)
  (loop for ast in function-asts
        never (function-is-an-ancestor-of-function-p
               function-ast ast ast-info)))

(defun find-innermost-function (local-function-asts ast-info)
  (loop for local-function-ast in local-function-asts
        when (function-ast-is-the-ancestor-of-none-in-set
              local-function-ast local-function-asts ast-info)
          return local-function-ast))

;;; Take a VARIABLE-DEFINITION-AST which is known to have at least one
;;; VARIABLE-REFERENCE-AST with a different owner.  Return a list of
;;; all the REFERENCE-ASTs having as owner the innermost
;;; function of all the owners of all the Reference-Asts and
;;; the innermost LOCAL-FUNCTION-AST.
(defun extract-innermost-variable-references
    (variable-definition-ast ast-info)
  (let* ((reference-asts
           (ico:reference-asts variable-definition-ast))
         (owner-asts
           (loop for variable-reference-ast in reference-asts
                 collect (owner-ast variable-reference-ast ast-info)))
         (innermost-function-ast
           (find-innermost-function owner-asts ast-info))
         (innermost-reference-asts
           (loop for variable-reference-ast in reference-asts
                 for owner-ast
                   = (owner-ast variable-reference-ast ast-info)
                 when (eq innermost-function-ast owner-ast)
                   collect variable-reference-ast)))
    ;; Remove the relevant Reference-Asts from the list
    ;; of Reference-Asts of the VARIABLE-DEFINITION-AST.
    (reinitialize-instance variable-definition-ast
      :reference-asts
      (set-difference reference-asts
                      innermost-reference-asts))
    (values innermost-reference-asts innermost-function-ast)))

(defun handle-callee-side
    (reference-asts let-temporary-ast index ast-info)
  (let* ((static-environment-variable-definition-ast
           (ico:variable-name-ast (ico:binding-ast let-temporary-ast)))
         (static-environment-variable-reference-ast
           (make-instance 'ico:variable-reference-ast
             :name (ico:name static-environment-variable-definition-ast)
             :definition-ast
             static-environment-variable-definition-ast))
         (index-ast
           (make-instance 'ico:literal-ast :literal index))
         (read-static-environment-ast
           (make-instance 'ico:read-static-environment-ast
             :static-environment-ast
             static-environment-variable-reference-ast   
             :index-ast index-ast))
         (variable-definition-ast
           (make-instance 'ico:variable-definition-ast
             :name (ico:name (first reference-asts))))
         (binding-ast
           (make-instance 'ico:variable-binding-ast
             :variable-name-ast variable-definition-ast
             :form-ast read-static-environment-ast))
         (variable-let-temporary-ast
           (make-instance 'ico:let-temporary-ast
             :binding-ast binding-ast)))
    (setf (owner-ast static-environment-variable-reference-ast ast-info)
          (owner-ast let-temporary-ast ast-info))
    (setf (owner-ast index-ast ast-info)
          (owner-ast let-temporary-ast ast-info))
    (setf (owner-ast read-static-environment-ast ast-info)
          (owner-ast let-temporary-ast ast-info))
    (setf (owner-ast variable-definition-ast ast-info)
          (owner-ast let-temporary-ast ast-info))
    (setf (owner-ast binding-ast ast-info)
          (owner-ast let-temporary-ast ast-info))
    (setf (owner-ast variable-let-temporary-ast ast-info)
          (owner-ast let-temporary-ast ast-info))
    (link static-environment-variable-definition-ast
          static-environment-variable-reference-ast)
    (loop for variable-reference-ast in reference-asts
          do (link variable-definition-ast variable-reference-ast))
    (wrap-form-asts variable-let-temporary-ast let-temporary-ast)))

(defun handle-caller-side
    (variable-definition-ast set-static-environment-ast ast-info)
  (let (;; A new VARIABLE-REFERENCE-AST to be used to add to the
        ;; set-static-environment-ast of the parent function.
        (variable-reference-ast
          (make-instance 'ico:variable-reference-ast
            :definition-ast variable-definition-ast
            :name (ico:name variable-definition-ast))))
    (setf (owner-ast variable-reference-ast ast-info)
          (owner-ast set-static-environment-ast ast-info))
    (link variable-definition-ast variable-reference-ast)
    ;; Add the new VARIABLE-REFERENCE-AST to the end of the
    ;; FORM-ASTs of the SET-STATIC-ENVIRONMENT-AST so as not to
    ;; alter previously assigned indices.
    (reinitialize-instance set-static-environment-ast
      :form-asts (append (ico:form-asts set-static-environment-ast)
                         (list variable-reference-ast)))))

;;; Take a VARIABLE-DEFINITION-AST which is known to have at least one
;;; VARIABLE-REFERENCE-AST with a different owner.  Take the innermost
;;; REFERENCE-ASTS, and add ASTs for manipulating the static
;;; environment accordingly.
(defun process-variable-references-with-innermost-owners
    (variable-definition-ast ast-info)
  (multiple-value-bind
        (innermost-reference-asts innermost-function-ast)
      (extract-innermost-variable-references
       variable-definition-ast ast-info)
    (let* ((entry (ensure-closure-entry innermost-function-ast ast-info))
           (set-static-environment-ast (set-static-environment-ast entry))
           (let-temporary-ast (let-temporary-ast  entry))
           (index (length (ico:form-asts set-static-environment-ast))))
      (handle-callee-side innermost-reference-asts
                          let-temporary-ast
                          index
                          ast-info)
      (handle-caller-side variable-definition-ast
                          set-static-environment-ast
                          ast-info))))

(defclass shared-variables-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)
   (%variable-asts :initform '() :accessor variable-asts)))

(defmethod iaw:walk-ast-node :around
    ((client shared-variables-client) (ast ico:variable-definition-ast))
  (call-next-method)
  (let ((ast-info (ast-info client)))
    (when (variable-is-shared-p ast ast-info)
      (pushnew ast (variable-asts client) :test #'eq)))
  ast)

;;; This function returns a list of VARIABLE-DEFINITION-ASTs such that
;;; the corresponding variable is shared.
(defun shared-variables (ast ast-info)
  (let ((client (make-instance 'shared-variables-client
                  :ast-info ast-info)))
    (iaw:walk-ast client ast)
    (variable-asts client)))

(defun process-one-shared-variable-ast (variable-definition-ast ast-info)
  (loop while (variable-is-shared-p variable-definition-ast ast-info)
        do (process-variable-references-with-innermost-owners
            variable-definition-ast ast-info)))

(defun closure-conversion (ast)
  (let* ((ast-info (compute-ast-info ast))
         (variable-definition-asts (shared-variables ast ast-info)))
    (check-ast ast ast-info)
    (loop for variable-definition-ast in variable-definition-asts
          do (process-one-shared-variable-ast
              variable-definition-ast ast-info)))
  ast)
