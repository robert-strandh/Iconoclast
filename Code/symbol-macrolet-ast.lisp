(cl:in-package #:iconoclast)

(defgeneric symbol-ast (ast))

(defgeneric expansion-ast (ast))

(defclass symbol-expansion-ast (ast)
  ((%symbol-ast
      :initarg :symbol-ast
      :reader symbol-ast)
   (%expansion-ast
      :initarg :expansion-ast
      :reader expansion-ast)))

(defgeneric symbol-expansion-asts (ast))

(defclass symbol-macrolet-ast
    (declaration-asts-mixiin form-asts-mixin ast)
  ((%symbol-expansion-asts
      :initarg :symbol-expansion-asts
      :reader symbol-expansion-asts)))
