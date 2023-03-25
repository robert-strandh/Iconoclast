(cl:in-package #:iconoclast-builder)

(define-make-node-method :restart-case ico:restart-case-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:restart-case-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast right))
