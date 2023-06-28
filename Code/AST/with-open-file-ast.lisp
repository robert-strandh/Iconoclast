(cl:in-package #:iconoclast)

(define-ast-class with-open-file-ast
    (declaration-asts-mixin
     form-asts-mixin
     ast)
  ((1 stream-ast)
   (1 filespec-ast)
   (* option-asts)))
