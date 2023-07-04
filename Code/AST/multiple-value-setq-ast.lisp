(cl:in-package #:iconoclast)

(define-ast-class multiple-value-setq-ast (ast)
  ((* name-asts)
   (1 values-ast)))
