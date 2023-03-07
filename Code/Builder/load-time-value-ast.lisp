(cl:in-package #:iconoclast-builder)

(define-make-node-method :load-time-value ico:load-time-value-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:load-time-value-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :read-only-p))
     (left ico:load-time-value-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :read-only-p-ast right))
