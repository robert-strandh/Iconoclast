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
    :initarg set-static-environment-ast
    :reader set-static-environment-ast)))

(defparameter *true-closure-entries* '())

(defun ensure-closure-entry (local-function-ast ast-info)
  (let ((entry (find local-function-ast *true-closure-entries*
                     :key #'local-function-ast
                     :test #'eq)))
    (if (null entry)
        (let* (;; The STATIC-ENVIRONMENT-AST that will wrap the
               ;; FORM-ASTs of the body of the LOCAL-FUNCTION-AST.
               (static-environment-ast
                 (make-instance 'ico:static-environment-ast))
               ;; The VARIABLE-DEFINITION-AST that of the variable
               ;; holding the static environment of the
               ;; LOCAL-FUNCTION-AST.
               (static-entry-variable-definition-ast
                 (make-instance 'ico:variable-definition-ast))
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
                   :binding-ast binding-ast
                   :form-asts (ico:form-asts local-function-ast)))
               ;; The SET-STATIC-ENVIRONMENT-AST will have a reference
               ;; to the VARIABLE-DEFINITION-AST of
               ;; LOCAL-FUNCTION-AST, so we need to create a new
               ;; VARIABLE-REFERENCE-AST and link them up.
               (variable-definition-for-function-ast
                 (ico:name-ast local-function-ast))
               (variable-reference-for-function-ast
                 (make-instance 'ico:variable-reference-ast
                   :variable-definition-ast
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
                   :local-function-ast local-function-ast
                   :let-temporary-ast let-temporary-ast)))
          (check-type labels-ast ico:labels-ast)
          ;; We have another VARIABLE-REFERENCE-AST referring to the
          ;; LOCAL-FUNCTION-AST, so we need to add it to the list of
          ;; VARIABLE-REFERENCE-ASTs of the VARIABLE-DEFINITION-AST
          ;; of the LOCAL-FUNCTION-AST.
          (reinitialize-instance variable-definition-for-function-ast
            :variable-reference-asts
            (cons variable-reference-for-function-ast
                  (ico:variable-reference-asts 
                   variable-definition-for-function-ast)))
          ;; Replace the FORM-ASTs of LOCAL-FUNCTION-AST by the
          ;; LET-TEMPORARY-AST containing those FORM-ASTs so that
          ;; the STATIC-ENTRY-VARIABLE-DEFINITION-AST is in scope
          ;; for all those FORM-ASTs.
          (reinitialize-instance local-function-ast
            :form-asts (list let-temporary-ast))
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

(defun find-innermost-function (local-function-asts ast-info)
  (loop for local-function-ast in local-function-asts
        for function-child-asts
          = (function-child-asts local-function-ast ast-info)
        when (null (intersection local-function-asts function-child-asts))
          return local-function-ast))

;;; Take a VARIABLE-DEFINITION-AST which is known to have at least one
;;; VARIABLE-REFERENCE-AST with a different owner.  Return a list of
;;; all the VARIABLE-REFERENCE-ASTs having as owner the innermost
;;; function of all the owners of all the VARIABLE-REFERENCE-ASTs and
;;; the innermost LOCAL-FUNCTION-AST.
(defun extract-innermost-variable-references
    (variable-definition-ast ast-info)
  (let* ((variable-reference-asts
           (ico:variable-reference-asts variable-definition-ast))
         (owner-asts
           (loop for variable-reference-ast in variable-reference-asts
                 collect (owner-ast variable-reference-ast ast-info)))
         (innermost-function-ast
           (find-innermost-function owner-asts ast-info))
         (innermost-variable-reference-asts
           (loop for variable-reference-ast in variable-reference-asts
                 for owner-ast
                   = (owner-ast variable-reference-ast ast-info)
                 when (eq innermost-function-ast owner-ast)
                   collect variable-reference-ast)))
    ;; Remove the relevant VARIABLE-REFERENCE-ASTs from the list
    ;; of VARIABLE-REFERENCE-ASTs of the VARIABLE-DEFINITION-AST.
    (reinitialize-instance variable-definition-ast
      :variable-reference-asts
      (set-difference variable-reference-asts
                      innermost-variable-reference-asts))
    (values innermost-variable-reference-asts innermost-function-ast)))
