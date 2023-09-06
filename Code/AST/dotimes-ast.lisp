(cl:in-package #:iconoclast)

(define-ast-class dotimes-ast
    (result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin
     macro-form-ast)
  ((1 variable-name-ast)
   (1 count-form-ast)))
