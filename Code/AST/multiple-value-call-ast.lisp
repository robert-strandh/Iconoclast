(cl:in-package #:iconoclast)

(define-ast-class multiple-value-call-ast
    (form-asts-mixin special-form-ast)
  ((1 function-ast)))
