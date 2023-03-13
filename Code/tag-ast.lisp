(cl:in-package #:iconoclast)

(defclass tag-ast (ast)
  ((%tag :initarg :tag :reader tag)))
