(cl:in-package #:iconoclast)

(define-ast-class destructuring-bind-ast
    (lambda-list-ast-mixin
     required-form-ast-mixin
     declaration-asts-mixin
     implicit-progn-ast-mixin
     macro-form-ast)
  ())
