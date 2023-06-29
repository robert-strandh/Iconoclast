(cl:in-package #:iconoclast)

(define-ast-class pushnew-ast (place-ast-mixin ast)
  ((1 item-ast)
   (? key-ast)
   (? test-ast)
   (? test-not-ast)))
