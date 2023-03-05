(cl:in-package #:iconoclast)

(defgeneric protected-form-ast (ast))

(defclass unwind-protect-ast (form-asts-mixin ast)
  ((%protected-form-ast
      :initarg :protected-form-ast
      :reader protected-form-ast)))