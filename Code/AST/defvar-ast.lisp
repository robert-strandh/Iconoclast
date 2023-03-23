(cl:in-package #:iconoclast)

(defclass defvar-or-defparameter-ast
    (documentation-ast-mixin variable-name-ast-mixin form-ast-mixin ast)
  ())

(defclass defvar-ast (defvar-or-defparameter-ast)
  ())

(defclass defparameter-ast (defvar-or-defparameter-ast)
  ())
