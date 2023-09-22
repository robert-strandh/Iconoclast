(cl:in-package #:iconoclast)

(define-ast-class multiple-value-bind-ast
    (implicit-progn-ast-mixin
     declaration-asts-mixin
     macro-form-ast)
  ((1 values-ast)
   (* variable-name-asts)))
