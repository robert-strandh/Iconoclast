(cl:in-package #:iconoclast)

(define-ast-class dolist-ast
    (result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin
     macro-form-ast)
  ((1 variable-name-ast)
   (1 list-form-ast)))
