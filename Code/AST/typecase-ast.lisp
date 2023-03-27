(cl:in-package #:iconoclast)

(defclass typecase-base-ast (form-ast-mixin ast)
  ())

(defclass typecase-ast (typecase-base-ast)
  ())

(defclass typecase-ast (etypecase-base-ast)
  ())

(defclass typecase-ast (ctypecase-base-ast)
  ())
