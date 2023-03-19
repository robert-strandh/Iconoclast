(cl:in-package #:iconoclast)

(defclass literal-ast (ast)
  ((%literal
    :initarg :literal
    :reader literal)))
