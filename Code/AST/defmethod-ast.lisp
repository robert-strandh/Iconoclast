(cl:in-package #:iconoclast)

(defclass specialized-lambda-list-ast (lambda-list-ast)
  ())

(defclass defmethod-ast (name-ast-mixin function-definition-ast)
  ())
