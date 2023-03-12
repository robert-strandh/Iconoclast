(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :function-name))
     &key source name)
  (make-instance 'ico:function-name-ast
    :origin source
    :name name))
