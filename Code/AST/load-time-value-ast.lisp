(cl:in-package #:iconoclast)

(define-ast-class load-time-value-ast (required-form-ast-mixin ast)
  ((? read-only-p-ast)))
