(cl:in-package #:iconoclast)

(define-ast-class print-unreadable-object-ast
    (object-ast-mixin implicit-progn-ast-mixin macro-form-ast)
  ((1 stream-ast)
   (? type-ast)
   (? identity-ast)))
