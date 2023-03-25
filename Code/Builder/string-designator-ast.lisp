(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :string-designator))
     &key source string)
  (make-instance 'ico:string-designator-ast
    :origin source
    :designated-string string))
