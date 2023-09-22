(cl:in-package #:iconoclast)

(define-ast-class situation-ast (name-ast)
  ())

(define-ast-class eval-when-ast (implicit-progn-ast-mixin special-form-ast)
  ((* situation-asts)))
