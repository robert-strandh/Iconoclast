(cl:in-package #:iconoclast)

(define-ast-class pprint-logical-block-ast
    (variable-name-ast-mixin
     object-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ((1 stream-symbol-ast)
   (1 prefix-ast)
   (1 per-line-prefix-ast)
   (1 suffix-ast)))
