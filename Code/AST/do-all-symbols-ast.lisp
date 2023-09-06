(cl:in-package #:iconoclast)

(define-ast-class do-all-symbols-ast
    (result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin
     macro-form-ast)
  ((1 variable-name-ast)))
