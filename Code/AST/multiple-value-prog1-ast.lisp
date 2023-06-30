(cl:in-package #:iconoclast)

(define-ast-class multiple-value-prog1-ast (form-asts-mixin ast)
  ((1 values-form-ast)))
