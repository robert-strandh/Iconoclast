(cl:in-package #:iconoclast)

(defgeneric place (ast))

(defclass place-ast (ast)
  ((%place
    :initarg :place
    :reader place)))

(defmethod children append ((ast place-ast))
  (list (cons "place" (place ast))))
