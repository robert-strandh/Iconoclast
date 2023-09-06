(cl:in-package #:iconoclast)

(define-ast-class prog2-ast
    (first-form-ast-mixin form-asts-mixin macro-form-ast)
  ((1 second-form-ast)))
