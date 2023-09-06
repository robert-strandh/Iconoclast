(cl:in-package #:iconoclast)

(define-ast-class define-symbol-macro-ast (macro-form-ast)
  ((1 symbol-ast)
   (1 expansion-ast)))
