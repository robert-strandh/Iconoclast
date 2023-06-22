(cl:in-package #:iconoclast)

(define-ast-class dolist-ast
    (variable-name-ast-mixin
     result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin)
  ((1 list-form-ast)))
