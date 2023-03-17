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

(defmethod children append ((ast symbol-expansion-ast))
  (list (cons "symbol-ast" (symbol-ast ast))
        (cons "expansion-ast" (expansion-ast ast))))

(defgeneric symbol-expansion-asts (ast))

(defclass symbol-macrolet-ast
    (declaration-asts-mixin form-asts-mixin ast)
  ((%symbol-expansion-asts
      :initform '()
      :initarg :symbol-expansion-asts
      :reader symbol-expansion-asts)))

(defmethod children append ((ast symbol-macrolet-ast))
  (list (cons "symbol-expansion-asts" (symbol-expansion-asts ast))))
