(cl:in-package #:iconoclast-builder)

(define-make-node-method :time ico:time-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:time-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast t))
