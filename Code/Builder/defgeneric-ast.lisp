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

(defmethod abp:relate
    ((builder builder)
     (relation (eql :generic-function-class))
     (left ico:defgeneric-ast)
     (right t)
     &key)
  (reinitialize-instance left :generic-function-class-ast right))
