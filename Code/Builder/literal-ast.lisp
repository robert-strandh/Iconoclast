(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :literal))
     &key value source)
  (make-instance 'ico:literal-ast
    :origin source
    :literal value))

(defmethod abp:node-kind ((builder builder) (node ico:literal-ast))
  :literal)

(defmethod abp:node-initargs ((builder builder) (node ico:literal-ast))
  `(:value ,(ico:literal node)))
