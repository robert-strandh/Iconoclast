(cl:in-package #:iconoclast)

(defgeneric second-form (ast))

(defclass prog2-ast (first-form-ast-mixin form-asts-mixin ast)
  ((%second-form-ast
    :initarg :second-form-ast
    :reader second-form-ast)))

(defmethod children append ((ast prog2-ast))
  (list (cons "second-form-ast" (second-form-ast ast))))
