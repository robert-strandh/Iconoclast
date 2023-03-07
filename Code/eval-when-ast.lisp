(cl:in-package #:iconoclast)

(defgeneric situation-asts (ast))

(defclass eval-when-ast (form-asts-mixin ast)
  ((%situation-asts
      :initform '()
      :initarg :situation-asts
      :reader situation-asts)))
