(cl:in-package #:iconoclast-builder)

(define-make-node-method :multiple-value-call ico:multiple-value-call-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :function-form))
     (left ico:multiple-value-call-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :function-form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :argument))
     (left ico:multiple-value-call-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts (append (ico:form-asts left) (list right))))
