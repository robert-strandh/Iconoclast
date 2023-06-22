(cl:in-package #:iconoclast)

(define-ast-class progv-ast (form-asts-mixin ast)
  ((1 symbols-ast)
   (1 values-ast)))
