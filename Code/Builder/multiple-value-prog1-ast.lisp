(cl:in-package #:iconoclast-builder)

(define-make-node-method :multiple-value-prog1 ico:multiple-value-prog1-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :values-form))
     (left ico:multiple-value-prog1-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :first-form right))