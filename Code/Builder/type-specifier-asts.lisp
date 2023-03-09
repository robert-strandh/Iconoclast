(cl:in-package #:iconoclast-builder)

(define-make-node-method :type-name ico:type-name-ast)

(define-make-node-method :atomic-type-specifier ico:atomic-type-specifier-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:atomic-type-specifier-ast)
     (right ico:type-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))
