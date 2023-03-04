(cl:in-package #:iconoclast)

(defclass lexical-function-ast (name-ast-mixin function-ast)
  ())

(defclass flet-or-labels-ast
    (declaration-asts-mixin form-asts-mixin ast)
  ((%lexical-function-asts
      :initarg :lexical-function-asts
      :reader lexical-function-asts)))

(defclass flet-ast (flet-or-labels-ast)
  ())

(defclass labels-ast (flet-or-labels-ast)
  ())