(cl:in-package #:iconoclast-builder)

(define-make-node-method :step ico:step-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:step-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast t))
