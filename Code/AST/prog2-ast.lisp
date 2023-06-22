(cl:in-package #:iconoclast)

(define-ast-class prog2-ast (first-form-ast-mixin form-asts-mixin ast)
  ((1 second-form-ast)))
