(cl:in-package #:iconoclast)

(define-ast-class multiple-value-call-ast (form-asts-mixin ast)
  ((1 function-form-ast)))
