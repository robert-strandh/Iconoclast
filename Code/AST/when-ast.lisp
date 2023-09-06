(cl:in-package #:iconoclast)

(define-ast-class when-ast (test-ast-mixin form-asts-mixin macro-form-ast)
  ())

(define-ast-class unless-ast (test-ast-mixin form-asts-mixin macro-form-ast)
  ())
