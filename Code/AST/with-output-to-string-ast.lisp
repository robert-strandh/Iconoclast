(cl:in-package #:iconoclast)

(define-ast-class with-output-to-string-ast
    (declaration-asts-mixin
     implicit-progn-ast-mixin
     macro-form-ast)
  ((1 var-ast)
   (? string-ast)
   (? element-type-ast)))
