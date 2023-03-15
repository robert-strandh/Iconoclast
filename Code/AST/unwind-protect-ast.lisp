(cl:in-package #:iconoclast)

(defgeneric protected-form-ast (ast))

(defclass unwind-protect-ast (form-asts-mixin ast)
  ((%protected-form-ast
      :initarg :protected-form-ast
      :reader protected-form-ast)))

(defmethod children append ((ast unwind-protect-ast))
  (list (cons "protected-form-ast" (protected-form-ast ast))))
