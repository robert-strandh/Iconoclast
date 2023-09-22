(cl:in-package #:iconoclast)

(define-ast-class when-ast
    (test-ast-mixin implicit-progn-ast-mixin macro-form-ast)
  ())

(define-ast-class unless-ast
    (test-ast-mixin implicit-progn-ast-mixin macro-form-ast)
  ())
