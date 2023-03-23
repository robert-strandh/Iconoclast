(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :variable-name))
     &key name source)
  (make-instance 'ico:variable-name-ast
    :name name
    :origin source))
