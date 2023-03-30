(cl:in-package #:iconoclast)

(defclass typecase-clause-ast (form-asts-mixin ast)
  ())

(defclass typecase-normal-clause-ast
    (type-specifier-ast-mixin typecase-clause-ast)
  ())

(defclass typecase-otherwise-clause-ast (typecase-clause-ast)
  ())

(defclass typecase-base-ast (clause-asts-mixin ast)
  ())

(defclass typecase-or-etypecase-ast (form-ast-mixin typecase-base-ast)
  ())

(defclass typecase-ast (typecase-or-etypecase-ast)
  ())

(defclass etypecase-ast (typecase-or-etypecase-ast)
  ())

(defclass ctypecase-ast (place-ast-mixin typecase-base-ast)
  ())
