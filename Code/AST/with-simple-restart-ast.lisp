(cl:in-package #:iconoclast)

(define-ast-class with-simple-restart-ast
    (name-ast-mixin form-asts-mixin ast)
  ((1 format-control-ast)
   (* format-argument-asts)))
