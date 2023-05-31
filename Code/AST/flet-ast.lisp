(cl:in-package #:iconoclast)

(defclass lexical-function-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     form-asts-mixin
     ast)
  ())

(defclass flet-or-labels-or-macrolet-ast
    (binding-asts-mixin declaration-asts-mixin form-asts-mixin ast)
  ())

(defclass flet-ast (flet-or-labels-or-macrolet-ast)
  ())

(defclass labels-ast (flet-or-labels-or-macrolet-ast)
  ())

(defclass macrolet-ast (flet-or-labels-or-macrolet-ast)
  ())
