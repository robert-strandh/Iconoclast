(cl:in-package #:iconoclast)

(define-ast-class unwind-protect-ast (form-asts-mixin ast)
  ((1 protected-form-ast)))
