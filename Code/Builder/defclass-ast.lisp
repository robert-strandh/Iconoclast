(cl:in-package #:iconoclast-builder)

(define-make-node-method :slot-specifier ico:slot-specifier-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:slot-specifier-ast)
     (right ico:variable-definition-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))
