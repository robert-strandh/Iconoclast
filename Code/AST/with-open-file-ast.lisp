(cl:in-package #:iconoclast)

(define-ast-class with-open-file-ast
    (declaration-asts-mixin
     implicit-progn-ast-mixin
     macro-form-ast)
  ((1 stream-ast)
   (1 filespec-ast)
   (* option-asts)))
