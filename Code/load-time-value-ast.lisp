(cl:in-package #:iconoclast)

(defgeneric read-only-p-ast (ast))

(defclass load-time-value-ast (form-ast-mixin ast)
  ((%read-only-p-ast
      :initarg :read-only-p-ast
      :reader read-only-p-ast)))

(defmethod children ((ast load-time-value-ast))
  (list (cons "read-only-p-ast" (read-only-p-ast ast))))
