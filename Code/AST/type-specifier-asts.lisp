(cl:in-package #:iconoclast)

(defclass type-name-ast (name-mixin ast)
  ())

(defclass atomic-type-specifier-ast (name-ast-mixin ast)
  ())
