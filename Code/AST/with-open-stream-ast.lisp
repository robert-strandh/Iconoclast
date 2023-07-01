(cl:in-package #:iconoclast)

(define-ast-class with-open-stream-ast
    (declaration-asts-mixin
     form-asts-mixin
     ast)
  ((1 var-ast)
   (1 stream-ast)))
