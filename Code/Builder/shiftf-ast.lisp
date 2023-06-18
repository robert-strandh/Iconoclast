(cl:in-package #:iconoclast-builder)

(define-make-node-method :shiftf ico:shiftf-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :new-value))
     (left ico:shiftf-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast t))
