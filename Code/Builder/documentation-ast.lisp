(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :documentation))
     &key source string)
  (make-instance 'ico:documentation-ast
    :origin source
    :documentation string))
