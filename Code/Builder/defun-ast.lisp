(cl:in-package #:iconoclast-builder)

(define-make-node-method :defun ico:defun-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:defun-ast)
     (right ico:function-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))
