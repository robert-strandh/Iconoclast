(cl:in-package #:iconoclast)

(define-ast-class situation-ast (name-ast)
  ())

(define-ast-class eval-when-ast (form-asts-mixin macro-form-ast)
  ((* situation-asts)))
