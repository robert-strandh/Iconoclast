(cl:in-package #:iconoclast)

(defgeneric count-form-ast (ast))

(defclass dotimes-ast
    (variable-name-ast-mixin
     result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin)
  ((%count-form-ast
    :initarg :count-form-ast
    :reader count-form-ast)))

(defmethod children append ((ast dotimes-ast))
  (list (cons "count-form-ast" (count-form-ast ast))))
