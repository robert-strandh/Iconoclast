(cl:in-package #:iconoclast)

(defclass push-ast (place-ast-mixin ast)
  ((%item-ast
    :initarg :item-ast
    :reader item-ast)))

(defmethod children append ((ast push-ast))
  (list "item-ast" (item-ast ast)))
