(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :variable-name))
     &key name source)
  (make-instance 'ico:variable-name-ast
    :name name
    :origin source))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :type-name))
     &key source name)
  (make-instance 'ico:type-name-ast
    :origin source
    :name name))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :function-name))
     &key source name)
  (make-instance 'ico:function-name-ast
    :origin source
    :name name))

(defmethod abp:node-initargs
    ((builder builder)
     (ast ico:name-ast))
  (list :name (ico:name ast)))
