(cl:in-package #:iconoclast-builder)

(define-make-node-method :the ico:the-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :type))
     (left ico:the-ast)
     (right ico:atomic-type-specifier-ast)
     &key)
  (reinitialize-instance left
    :value-type-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:the-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-ast right))
