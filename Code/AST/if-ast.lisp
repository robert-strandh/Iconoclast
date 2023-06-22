(cl:in-package #:iconoclast)

(define-ast-class if-ast (test-ast-mixin ast)
  ((1 then-ast)
   (? else-ast)))
