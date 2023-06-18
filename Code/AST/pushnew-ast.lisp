(cl:in-package #:iconoclast)

(defclass pushnew-ast (place-ast-mixin ast)
  ((%item-ast
    :initarg :item-ast
    :reader item-ast)))

(defmethod children append ((ast pushnew-ast))
  (list "item-ast" (item-ast ast)))
