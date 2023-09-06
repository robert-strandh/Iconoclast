(cl:in-package #:iconoclast)

(define-ast-class lambda-ast
    (lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     form-asts-mixin
     macro-form-ast)
  ())
