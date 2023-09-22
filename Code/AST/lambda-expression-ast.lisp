(cl:in-package #:iconoclast)

(define-ast-class lambda-expression-ast
    (implicit-progn-ast-mixin
     documentation-ast-mixin
     declaration-asts-mixin
     lambda-list-ast-mixin
     ast)
  ())
