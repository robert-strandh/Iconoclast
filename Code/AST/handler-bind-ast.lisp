(cl:in-package #:iconoclast)

(define-ast-class handler-binding-ast
    (type-specifier-ast-mixin required-form-ast-mixin ast)
  ())

(define-ast-class handler-bind-ast
    (binding-asts-mixin implicit-progn-ast-mixin macro-form-ast)
  ())
