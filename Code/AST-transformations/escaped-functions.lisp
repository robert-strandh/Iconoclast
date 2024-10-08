(cl:in-package #:iconoclast-ast-transformations)

;;; To compute which functions escape, for each function, find its
;;; defined name, from that, find the references.  For each reference,
;;; find its parent AST.  If the parent AST is not an application, or
;;; if it is an application, but the reference is not in an operator
;;; position, then the function escapes.

;;; We can probably use a list here, becuse the number of escaped
;;; functions is likely to be small.
(defclass escaped-functions-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)))

(defmethod iaw:walk-ast-node :around
    ((client escaped-functions-client) (ast ico:local-function-ast))
  (let ((definition-ast (ico:name-ast ast)))
    (loop for reference-ast
            in (ico:local-function-name-reference-asts definition-ast)
          for parent-ast = (parent reference-ast (ast-info client))
          unless (and (typep parent-ast 'ico:application-ast)
                      (eq reference-ast (ico:function-name-ast parent-ast)))
            do (push ast (escaped-functions (ast-info client)))))
  ast)

(defun compute-escaped-functions (ast ast-info)
  (let ((client (make-instance 'escaped-functions-client
                  :ast-info ast-info)))
    (iaw:walk-ast client ast)))
