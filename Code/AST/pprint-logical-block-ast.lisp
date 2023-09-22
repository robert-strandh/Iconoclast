(cl:in-package #:iconoclast)

(define-ast-class pprint-logical-block-ast
    (object-ast-mixin
     declaration-asts-mixin
     implicit-progn-ast-mixin
     macro-form-ast)
  ((1 stream-symbol-ast)
   (? prefix-ast)
   (? per-line-prefix-ast)
   (? suffix-ast)))
