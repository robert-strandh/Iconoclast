(cl:in-package #:iconoclast)

(defclass typecase-base-ast (form-ast-mixin ast)
  ())

(defclass typecase-ast (typecase-base-ast)
  ())

(defclass etypecase-ast (typecase-base-ast)
  ())

(defclass ctypecase-ast (typecase-base-ast)
  ())
