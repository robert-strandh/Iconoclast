(cl:in-package #:iconoclast)

(define-ast-class the-ast (required-form-ast-mixin special-form-ast)
  ((1 value-type-ast)))
