(cl:in-package #:iconoclast)

(define-ast-class tagbody-with-variable-ast
    (segment-asts-mixin special-form-ast)
  ((1 variable-reference-ast)))
