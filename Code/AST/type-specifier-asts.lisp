(cl:in-package #:iconoclast)

(define-ast-class type-specifier-ast (name-ast-mixin ast)
  ())

(define-ast-class atomic-type-specifier-ast (type-specifier-ast)
  ())

(define-ast-class subsidiary-item-ast (value-mixin ast)
  ())

(define-ast-class compound-type-specifier-ast (type-specifier-ast)
  ((* subsidiary-item-asts)
   (? atomic-type-specifier-ast)))
