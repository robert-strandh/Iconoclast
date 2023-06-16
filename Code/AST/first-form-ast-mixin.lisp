(cl:in-package #:iconoclast)

(defgeneric first-form-ast (ast))

(defclass first-form-ast-mixin ()
  ((%first-form-ast
      :initarg :first-form-ast
      :reader first-form-ast)))

(defmethod children append ((ast first-form-ast-mixin))
  (list (cons "first-form-ast" (first-form-ast ast))))
