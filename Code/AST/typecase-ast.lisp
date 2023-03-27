(cl:in-package #:iconoclast)

(defclass typecase-clause-ast (ast)
  ())

(defclass typecase-normal-clause-ast (typecase-clause-ast)
  ())

(defclass typecase-base-ast (form-ast-mixin ast)
  ())

(defclass typecase-ast (typecase-base-ast)
  ())

(defclass etypecase-ast (typecase-base-ast)
  ())

(defclass ctypecase-ast (typecase-base-ast)
  ())
