(cl:in-package #:iconoclast)

(define-ast-class cond-clause-ast
    (test-ast-mixin implicit-progn-ast-mixin ast)
  ())

(define-ast-class cond-ast (clause-asts-mixin macro-form-ast)
  ())
