(cl:in-package #:iconoclast)

(define-ast-class dotimes-ast
    (variable-name-ast-mixin
     result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin)
  ((1 count-form-ast)))
