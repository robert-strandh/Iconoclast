(cl:in-package #:iconoclast)

(defgeneric name (ast))

(defclass name-ast (ast)
  ((%name :initarg :name :reader name)))
