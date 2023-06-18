(cl:in-package #:iconoclast)

(defgeneric place-asts (ast))

(defclass place-asts-mixin ()
  ((%place-asts
    :initform '()
    :initarg :place-asts
    :reader place-asts)))

(defmethod children append ((ast place-asts-mixin))
  (list (cons "place-asts" (place-asts ast))))
