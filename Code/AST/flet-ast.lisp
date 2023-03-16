(cl:in-package #:iconoclast)

(defclass lexical-function-ast (name-ast-mixin function-definition-ast)
  ())

(defclass flet-or-labels-ast
    (declaration-asts-mixin form-asts-mixin ast)
  ((%lexical-function-asts
      :initform '()
      :initarg :lexical-function-asts
      :reader lexical-function-asts)))

(defmethod children append ((ast flet-or-labels-ast))
  (list (cons "lexical-function-asts" (lexical-function-asts ast))))

(defclass flet-ast (flet-or-labels-ast)
  ())

(defclass labels-ast (flet-or-labels-ast)
  ())

(defclass macrolet-ast (flet-or-labels-ast)
  ())
