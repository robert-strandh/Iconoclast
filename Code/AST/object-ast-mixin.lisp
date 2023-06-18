(cl:in-package #:iconoclast)

(defgeneric object-ast (ast))

(defclass object-ast-mixin ()
  ((%object-ast
    :initarg :object-ast
    :reader object-ast)))

(defmethod children append ((ast object-ast-mixin))
  (list (cons "object-ast" (object-ast ast))))
