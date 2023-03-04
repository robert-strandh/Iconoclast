(cl:in-package #:iconoclast)

(defgeneric first-form (ast))

(defclass multiple-value-prog1-ast (form-asts-mixin ast)
  ((%first-form
      :initarg :first-form
      :reader first-form)))