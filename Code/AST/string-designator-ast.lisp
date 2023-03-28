(cl:in-package #:iconoclast)

(defgeneric designated-string (string-designator-ast))

(defclass string-designator-ast (ast)
  ((%designated-string
    :initarg :designated-string
    :reader designated-string)))

(defmethod children append ((ast string-designator-ast))
  (list (cons "designated-string" (designated-string ast))))
