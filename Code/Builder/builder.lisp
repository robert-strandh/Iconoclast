(cl:in-package #:iconoclast-builder)

(defclass builder ()
  ())

(defmacro define-make-node-method (kind class-name)
  `(defmethod abp:make-node
       ((builder builder)
        (kind (eql ,kind))
        &rest initargs
        &key source)
      (apply #'make-instance ',class-name
             :origin source
             :allow-other-keys t
             initargs)))
