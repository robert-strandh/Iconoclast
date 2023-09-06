(cl:in-package #:iconoclast)

(define-ast-class pprint-logical-block-ast
    (object-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     macro-form-ast)
  ((1 stream-symbol-ast)
   (? prefix-ast)
   (? per-line-prefix-ast)
   (? suffix-ast)))
