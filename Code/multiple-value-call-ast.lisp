(cl:in-package #:iconoclast)

(defgeneric function-call-form-ast (ast))

(defclass multiple-value-call-ast (form-asts-mixin ast)
  ((%function-call-form-ast
      :initarg :function-call-form-ast
      :reader function-call-form-ast)))
