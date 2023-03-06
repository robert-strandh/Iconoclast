(cl:in-package #:iconoclast-builder)

(defclass builder ()
  ())

(defmacro define-make-node-method (kind class-name)
  `(defmethod abp:make-node
       ((builder builder)
        (kind (eql ,kind))
        &key source)
      (make-instance ',class-name
        :origin source)))