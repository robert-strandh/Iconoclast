(cl:in-package #:iconoclast)

(define-ast-class with-output-to-string-ast
    (declaration-asts-mixin
     form-asts-mixin
     macro-form-ast)
  ((1 var-ast)
   (? string-ast)
   (? element-type-ast)))
