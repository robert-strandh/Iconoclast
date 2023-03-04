(cl:in-package #:iconoclast)

(defgeneric value-type-ast (ast))

(defclass the-ast (form-ast-mixin ast)
  ((%value-type-ast
      :initarg :value-type-ast
      :reader value-type-ast)))
