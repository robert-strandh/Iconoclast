(cl:in-package #:iconoclast-builder)

(define-make-node-method :function ico:function-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:function-ast)
     (right ico:function-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :lambda))
     (left ico:function-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :name-ast right))
