(cl:in-package #:iconoclast)

(define-ast-class with-open-file-ast
    (variable-name-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ((1 filespec-ast)
   (* option-asts)))
