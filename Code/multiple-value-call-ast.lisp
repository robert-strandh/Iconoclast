(cl:in-package #:iconoclast)

(defgeneric function-form-ast (ast))

(defclass multiple-value-call-ast (form-asts-mixin ast)
  ((%function-form-ast
      :initarg :function-form-ast
      :reader function-form-ast)))
