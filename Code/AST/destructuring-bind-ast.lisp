(cl:in-package #:iconoclast)

(define-ast-class destructuring-bind-ast
    (lambda-list-ast-mixin
     required-form-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     macro-form-ast)
  ())
