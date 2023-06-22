(cl:in-package #:iconoclast)

(define-ast-class multiple-value-bind-ast
    (form-ast-mixin form-asts-mixin declaration-asts-mixin ast)
  ((* variable-name-asts)))
