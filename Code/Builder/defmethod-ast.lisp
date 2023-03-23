(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :specialized-lambda-list ico:specialized-lambda-list-ast)

(define-make-node-method :defmethod ico:defmethod-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:defmethod-ast)
     (right ico:function-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))
