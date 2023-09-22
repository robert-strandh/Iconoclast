(cl:in-package #:iconoclast)

(define-ast-class progv-ast (implicit-progn-ast-mixin special-form-ast)
  ((1 symbols-ast)
   (1 values-ast)))
