(cl:in-package #:iconoclast)

(define-ast-class unwind-protect-ast (form-asts-mixin special-form-ast)
  ((1 protected-form-ast)))
