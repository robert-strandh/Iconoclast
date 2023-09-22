(cl:in-package #:iconoclast)

(define-ast-class with-input-from-string-ast
    (declaration-asts-mixin
     implicit-progn-ast-mixin
     macro-form-ast)
  ((1 var-ast)
   (1 string-ast)
   (? index-ast)
   (? start-ast)
   (? end-ast)))
