(cl:in-package #:iconoclast)

(define-ast-class destructuring-bind-ast
    (lambda-list-ast-mixin
     form-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ())
