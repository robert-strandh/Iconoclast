(cl:in-package #:iconoclast)

(defgeneric binding-asts (ast))

(defclass binding-asts-mixin ()
  ((%binding-asts
    :initform '()
    :initarg :binding-asts
    :reader binding-asts)))

(defmethod children append ((ast binding-asts-mixin))
  (list (cons "binding-asts" (binding-asts ast))))
