(cl:in-package #:iconoclast)

(define-ast-class with-input-from-string-ast
    (variable-name-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ((1 string-ast)
   (? index-ast)
   (? start-ast)
   (? end-ast)))
