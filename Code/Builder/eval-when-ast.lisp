(cl:in-package #:iconoclast-builder)

(define-make-node-method :eval-when ico:eval-when-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :situation))
     (left ico:eval-when-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :situation-asts (append (ico:situation-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:eval-when-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts (append (ico:form-asts left) (list right))))
