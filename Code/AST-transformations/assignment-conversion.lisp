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
      (push variable-definition-ast (variable-asts client))))
  ast)

;;; This function returns a list of VARIABLE-DEFINITION-ASTs such that
;;; the corresponding variable is both shared and assigned to.
(defun assigned-to-shared-variables (ast)
  (let* ((ast-info (compute-ast-info ast))
         (client (make-instance 'assigned-to-shared-variables-client
                   :ast-info ast-info)))
    (iaw:walk-ast client ast)
    (variable-asts client)))
