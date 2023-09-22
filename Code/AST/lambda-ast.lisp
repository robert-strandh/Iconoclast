(cl:in-package #:iconoclast)

(define-ast-class lambda-ast
    (lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     implicit-progn-ast-mixin
     macro-form-ast)
  ())
