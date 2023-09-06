(cl:in-package #:iconoclast)

(define-ast-class pushnew-ast (place-ast-mixin macro-form-ast)
  ((1 item-ast)
   (? key-ast)
   (? test-ast)
   (? test-not-ast)))
