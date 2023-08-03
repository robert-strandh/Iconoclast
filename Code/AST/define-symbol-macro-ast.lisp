(cl:in-package #:iconoclast)

(define-ast-class define-symbol-macro-ast (ast)
  ((1 symbol-ast)
   (1 expansion-ast)))
