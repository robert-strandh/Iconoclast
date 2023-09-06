(cl:in-package #:iconoclast)

(define-ast-class load-time-value-ast
    (required-form-ast-mixin special-form-ast)
  ((? read-only-p-ast)))
