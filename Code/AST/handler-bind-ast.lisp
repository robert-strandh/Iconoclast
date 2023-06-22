(cl:in-package #:iconoclast)

(define-ast-class handler-binding-ast
    (type-specifier-ast-mixin form-ast-mixin ast)
  ())

(define-ast-class handler-bind-ast (binding-asts-mixin form-asts-mixin ast)
  ())
