(cl:in-package #:iconoclast)

(define-ast-class print-unreadable-object-ast
    (object-ast-mixin form-asts-mixin macro-form-ast)
  ((1 stream-ast)
   (? type-ast)
   (? identity-ast)))
