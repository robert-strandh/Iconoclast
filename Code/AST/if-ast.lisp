(cl:in-package #:iconoclast)

(define-ast-class if-ast (test-ast-mixin special-form-ast)
  ((1 then-ast)
   (? else-ast)))
