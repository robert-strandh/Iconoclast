(cl:in-package #:iconoclast)

(defgeneric first-form-ast (ast))

(defclass multiple-value-prog1-ast (form-asts-mixin ast)
  ((%first-form-ast
      :initarg :first-form-ast
      :reader first-form-ast)))

(defmethod children append ((ast multiple-value-prog1-ast))
  (list (cons "first-form-ast" (first-form-ast ast))))
