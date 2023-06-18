(cl:in-package #:iconoclast)

(defgeneric indicator-ast (ast))

(defclass remf-ast (place-ast-mixin ast)
  ((%indicator-ast
    :initarg :indicator-ast
    :reader indicator-ast)))

(defmethod children append ((ast remf-ast))
  (list (cons "indicator-ast" (indicator-ast ast))))
