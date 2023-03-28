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
    (declaration-asts-mixin form-asts-mixin ast)
  ((%lexical-function-asts
      :initform '()
      :initarg :lexical-function-asts
      :reader lexical-function-asts)))

(defmethod children append ((ast flet-or-labels-or-macrolet-ast))
  (list (cons "lexical-function-asts" (lexical-function-asts ast))))

(defclass flet-ast (flet-or-labels-or-macrolet-ast)
  ())

(defclass labels-ast (flet-or-labels-or-macrolet-ast)
  ())

(defclass macrolet-ast (flet-or-labels-or-macrolet-ast)
  ())
