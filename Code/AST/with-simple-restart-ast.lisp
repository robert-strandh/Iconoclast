(cl:in-package #:iconoclast)

(define-ast-class with-simple-restart-ast
    (name-ast-mixin implicit-progn-ast-mixin macro-form-ast)
  ((1 format-control-ast)
   (* format-argument-asts)))
