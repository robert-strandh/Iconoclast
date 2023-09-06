(cl:in-package #:iconoclast)

(define-ast-class nth-value-ast (form-ast-mixin macro-form-ast)
  ((1 n-ast)))
