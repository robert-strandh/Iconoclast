(cl:in-package #:iconoclast)

(defclass delta-ast-mixin ()
  ((%delta-ast
    :initform nil
    :initarg :delta-ast
    :reader delta-ast)))

(defmethod children append ((ast delta-ast-mixin))
  (list (cons "delta-ast" (delta-ast ast))))
