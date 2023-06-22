(cl:in-package #:iconoclast)

(define-ast-class lambda-expression-ast
    (form-asts-mixin
     documentation-ast-mixin
     declaration-asts-mixin
     lambda-list-ast-mixin
     ast)
  ())
