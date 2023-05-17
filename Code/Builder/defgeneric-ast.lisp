(cl:in-package #:iconoclast-builder)

(define-make-node-method :defgeneric ico:defgeneric-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:defgeneric-ast)
     (right ico:function-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))
