(cl:in-package #:iconoclast)

(defclass type-specifier-ast (name-ast-mixin ast)
  ())

(defclass atomic-type-specifier-ast (type-specifier-ast)
  ())

(defclass subsidiary-item-ast (value-mixin ast)
  ())

(define-ast-class compound-type-specifier-ast (type-specifier-ast)
  ((* subsidiary-item-asts)
   (? atomic-type-specifier-ast)))
