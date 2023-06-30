(cl:in-package #:iconoclast)

(define-ast-class with-output-to-string-ast
    (declaration-asts-mixin
     form-asts-mixin
     ast)
  ((1 var-ast)
   (? string-ast)
   (? element-type-ast)))
