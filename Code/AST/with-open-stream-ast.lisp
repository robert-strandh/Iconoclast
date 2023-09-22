(cl:in-package #:iconoclast)

(define-ast-class with-open-stream-ast
    (declaration-asts-mixin
     implicit-progn-ast-mixin
     macro-form-ast)
  ((1 var-ast)
   (1 stream-ast)))
