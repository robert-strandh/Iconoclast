(cl:in-package #:iconoclast)

(define-ast-class load-time-value-ast (form-ast-mixin ast)
  ((? read-only-p-ast)))
