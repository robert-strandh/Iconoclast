(cl:in-package #:iconoclast)

(define-ast-class multiple-value-prog1-ast (form-asts-mixin special-form-ast)
  ((1 values-ast)))
