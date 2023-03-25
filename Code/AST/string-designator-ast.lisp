(cl:in-package #:iconoclast)

(defgeneric designated-string (string-designator-ast))

(defclass string-designator-ast (ast)
  ((%designated-string
    :initarg :designated-string
    :reader designated-string)))
