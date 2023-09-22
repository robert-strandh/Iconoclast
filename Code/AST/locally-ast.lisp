(cl:in-package #:iconoclast)

(define-ast-class locally-ast
    (declaration-asts-mixin implicit-progn-ast-mixin special-form-ast)
  ())
