(cl:in-package #:iconoclast-builder)

(define-make-node-method :return ico:return-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :result))
     (left ico:return-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast right))
