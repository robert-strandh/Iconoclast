(cl:in-package #:iconoclast)

(defclass situation-ast (name-ast)
  ())

(defgeneric situation-asts (ast))

(defclass eval-when-ast (form-asts-mixin ast)
  ((%situation-asts
      :initform '()
      :initarg :situation-asts
      :reader situation-asts)))

(defmethod children append ((ast eval-when-ast))
  (list (cons "situation-asts" (situation-asts ast))))
