(cl:in-package #:iconoclast)

(defclass typecase-clause-ast (form-asts-mixin ast)
  ())

(defclass typecase-normal-clause-ast (typecase-clause-ast)
  ((%type-specifier-ast
    :initarg :type-specifier-ast
    :reader type-specifier-ast)))

(defclass typecase-base-ast (clause-asts-mixin form-ast-mixin ast)
  ())

(defclass typecase-ast (typecase-base-ast)
  ())

(defclass etypecase-ast (typecase-base-ast)
  ())

(defclass ctypecase-ast (typecase-base-ast)
  ())
