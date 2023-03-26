(cl:in-package #:iconoclast)

(defclass multiple-value-bind-ast
    (form-ast-mixin form-asts-mixin declaration-asts-mixin ast)
  ((%variable-name-asts
    :initform '()
    :initarg :variable-name-asts
    :reader variable-name-asts)))

(defmethod children append ((ast multiple-value-bind-ast))
  (list (cons "variable-name-asts" (variable-name-asts ast))))
