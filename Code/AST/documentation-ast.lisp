(cl:in-package #:iconoclast)

(defclass documentation-ast (ast)
  ((%documentation
    :initarg :documentation
    :reader documentation)))
