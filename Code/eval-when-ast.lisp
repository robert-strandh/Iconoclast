(cl:in-package #:iconoclast)

(defgeneric situation-asts (ast))

(defclass eval-when-ast (ast)
  ((%situations-asts
      :initarg :situation-asts
      :reader situation-asts)
   (%form-asts
      :initarg :form-asts
      :reader form-asts)))
