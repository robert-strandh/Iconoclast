(cl:in-package #:iconoclast)

(define-ast-class deftype-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     implicit-progn-ast-mixin
     macro-form-ast)
  ())
