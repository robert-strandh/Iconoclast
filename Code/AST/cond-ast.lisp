(cl:in-package #:iconoclast)

(define-ast-class cond-clause-ast (test-ast-mixin form-asts-mixin ast)
  ())

(define-ast-class cond-ast (clause-asts-mixin ast)
  ())
