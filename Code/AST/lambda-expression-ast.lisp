(cl:in-package #:iconoclast)

(defclass lambda-expression-ast
    (form-asts-mixin
     documentation-ast-mixin
     declaration-asts-mixin
     lambda-list-ast-mixin
     ast)
  ())
