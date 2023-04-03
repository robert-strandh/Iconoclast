(cl:in-package #:iconoclast-builder)

(define-make-node-method :return-from ico:return-from-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:return-from-ast)
     (right ico:block-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :result))
     (left ico:return-from-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-ast right))
