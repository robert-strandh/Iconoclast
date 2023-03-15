(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :type-name))
     &key source name)
  (make-instance 'ico:type-name-ast
    :origin source
    :name name))

(define-make-node-method :atomic-type-specifier ico:atomic-type-specifier-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:atomic-type-specifier-ast)
     (right ico:type-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))
