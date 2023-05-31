(cl:in-package #:iconoclast)

(defclass handler-binding-ast
    (type-specifier-ast-mixin form-ast-mixin ast)
  ())

(defclass handler-bind-ast (binding-asts-mixin form-asts-mixin ast)
  ())
