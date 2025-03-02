(cl:in-package #:iconoclast)

(define-ast-class catch-ast
    (implicit-progn-ast-mixin special-form-ast)
  ((1 tag-form-ast)))

(define-ast-class throw-ast
    (required-form-ast-mixin special-form-ast)
  ((1 tag-form-ast)))
