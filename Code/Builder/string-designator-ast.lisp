(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :string-designator))
     &key source string)
  (make-instance 'ico:string-designator-ast
    :origin source
    :designated-string string))

(defmethod abp:node-kind ((builder builder) (node ico:string-designator-ast))
  :string-designator)

(defmethod abp:node-initargs
    ((builder builder) (node ico:string-designator-ast))
  `(:string ,(ico:designated-string node)))
