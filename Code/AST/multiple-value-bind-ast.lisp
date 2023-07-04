(cl:in-package #:iconoclast)

(define-ast-class multiple-value-bind-ast
    (form-asts-mixin
     declaration-asts-mixin
     ast)
  ((1 values-ast)
   (* variable-name-asts)))
