(cl:in-package #:iconoclast)

(defclass lexical-function-ast (name-ast-mixin function-definition-ast)
  ())

(defclass flet-or-labels-or-macrolet-ast
    (declaration-asts-mixin form-asts-mixin ast)
  ((%lexical-function-asts
      :initarg :lexical-function-asts
      :reader lexical-function-asts)))

(defclass flet-ast (flet-or-labels-or-macrolet-ast)
  ())

(defclass labels-ast (flet-or-labels-or-macrolet-ast)
  ())

(defclass macrolet-ast (flet-or-labels-or-macrolet-ast)
  ())