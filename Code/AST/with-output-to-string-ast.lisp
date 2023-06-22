(cl:in-package #:iconoclast)

(define-ast-class with-output-to-string-ast
    (variable-name-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ((1 string-ast)
   (? element-type-ast)))
