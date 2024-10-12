(cl:in-package #:iconoclast-ast-transformations)

;;; This file contains code for assignment conversion.  In some cases,
;;; when a shared variable is assigned to, we need to introduce a cell
;;; to hold the variable value.  In the current code, we consider
;;; every shared variable that occurs as the VARIABLE-NAME-AST of a
;;; SIMPLE-SETQ-AST to be subject to assignment conversion.

;;; This function takes a VARIABLE-DEFINITION-AST and returns true if
;;; and only if any of its corresponding VARIABLE-REFERENCE-ASTs has a
;;; different owner from the VARIABLE-DEFINITION-AST.
(defun variable-is-shared-p (variable-definition-ast ast-info)
  (loop with definition-owner-ast
          = (owner-ast variable-definition-ast ast-info)
        for variable-reference-ast
          in (ico:variable-reference-asts variable-definition-ast)
        for reference-owner-ast
          = (owner-ast variable-reference-ast ast-info)
            thereis (not (eq definition-owner-ast reference-owner-ast))))

(defclass assigned-to-shared-variables-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)
   (%variable-asts :initform '() :accessor variable-asts)))

(defmethod iaw:walk-ast-node :around
    ((client assigned-to-shared-variables-client) (ast ico:simple-setq-ast))
  (call-next-method)
  (let* ((variable-reference-ast (ico:variable-name-ast ast))
         (variable-definition-ast
           (ico:variable-definition-ast variable-reference-ast))
         (ast-info (ast-info client)))
    (when (variable-is-shared-p variable-definition-ast ast-info)
      (pushnew variable-definition-ast (variable-asts client)
               :test #'eq)))
  ast)

;;; This function returns a list of VARIABLE-DEFINITION-ASTs such that
;;; the corresponding variable is both shared and assigned to.
(defun assigned-to-shared-variables (ast ast-info)
  (let ((client (make-instance 'assigned-to-shared-variables-client
                  :ast-info ast-info)))
    (iaw:walk-ast client ast)
    (variable-asts client)))

(defun add-make-cell-ast
    (local-function-ast variable-definition-ast)
  (let* ((new-variable-reference-ast
           (make-instance 'ico:variable-reference-ast
             :name (ico:name variable-definition-ast)
             :variable-definition-ast variable-definition-ast))
         (new-variable-definition-ast
           (make-instance 'ico:variable-definition-ast
             :name nil
             :variable-reference-asts '()))
         (variable-binding-ast
           (make-instance 'ico:variable-binding-ast
             :variable-name-ast new-variable-definition-ast
             :form-ast new-variable-reference-ast))
         (let-temporary-ast
           (make-instance 'ico:let-temporary-ast
             :binding-ast variable-binding-ast
             :form-asts (ico:form-asts local-function-ast))))
    (reinitialize-instance variable-definition-ast
      :variable-reference-asts
      (cons new-variable-reference-ast
            (ico:variable-reference-asts variable-definition-ast)))
    (reinitialize-instance local-function-ast
      :form-asts (list let-temporary-ast))))

;;; This function will ultimately contain code for introducing
;;; cell-related ASTs.
(defun assignment-conversion (ast)
  (let* ((ast-info (compute-ast-info ast))
         (variable-asts (assigned-to-shared-variables ast ast-info)))
    (loop for variable-definition-ast in variable-asts
          for local-function-ast
            = (owner-ast variable-definition-ast ast-info)
          do (add-make-cell-ast
              local-function-ast variable-definition-ast)))
  ast)