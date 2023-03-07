(cl:in-package #:iconoclast-builder)

(define-make-node-method :function ico:function-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :lambda))
     (left ico:function-ast)
     (right ico:function-definition-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))
