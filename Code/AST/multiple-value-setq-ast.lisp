(cl:in-package #:iconoclast)

(define-ast-class multiple-value-setq-ast (macro-form-ast)
  ((* name-asts)
   (1 values-ast)))
