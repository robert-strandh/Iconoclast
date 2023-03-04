(cl:in-package #:iconoclast)

(defgeneric function-call-form (ast))

(defclass multiple-value-call-ast (form-asts-mixin ast)
  ((%function-call-form
      :initarg :function-call-form
      :reader function-call-form)))