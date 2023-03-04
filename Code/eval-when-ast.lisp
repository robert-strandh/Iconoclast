(cl:in-package #:iconoclast)

(defgeneric situation-asts (ast))

(defclass eval-when-ast (form-asts-mixin ast)
  ((%situations-asts
      :initarg :situation-asts
      :reader situation-asts)))
