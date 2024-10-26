(cl:in-package #:iconoclast-ast-transformations)

(defclass function-definition-and-reference-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client function-definition-and-reference-client)
     (ast ico:function-definition-ast))
  (call-next-method)
  (change-class ast 'ico:variable-definition-ast
                :reference-asts
                (ico:reference-asts ast)))

(defmethod iaw:walk-ast-node :around
    ((client function-definition-and-reference-client)
     (ast ico:function-reference-ast))
  (call-next-method)
  (change-class ast 'ico:variable-reference-ast
                :definition-ast
                (ico:definition-ast ast)))

(defun transform-function-definition-and-reference (ast)
  (let ((client (make-instance 'function-definition-and-reference-client)))
    (iaw:walk-ast client ast))
  ast)
