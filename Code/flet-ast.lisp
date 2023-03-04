(cl:in-package #:iconoclast)

(defgeneric name-ast (ast))

(defclass lexical-function-ast (function-ast)
  ((%name-ast
      :initarg :name-ast
      :reader name-ast)))

(defclass flet-or-labels-ast (ast)
  ((%lexical-function-asts
      :initarg :lexical-function-asts
      :reader lexical-function-asts)
   (%declaration-asts
      :initarg :declaration-asts
      :reader declaration-asts)
   (%form-asts
      :initarg :form-asts
      :reader form-asts)))

(defclass flet-ast (flet-or-labels-ast)
  ())

(defclass labels-ast (flet-or-labels-ast)
  ())