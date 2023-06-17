(cl:in-package #:iconoclast)

(defclass result-ast-mixin ()
  ((%result-ast
    :initarg :result-ast
    :reader result-ast)))

(defmethod children append ((ast result-ast-mixin))
  (list (cons "result-ast" (result-ast ast))))
