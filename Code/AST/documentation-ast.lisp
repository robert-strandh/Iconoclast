(cl:in-package #:iconoclast)

(defclass documentation-ast (ast)
  ((%documentation
    :initarg :documentation
    :reader documentation)))

(defmethod children append ((ast documentation-ast))
  (list (cons "documentation" (documentation ast))))
