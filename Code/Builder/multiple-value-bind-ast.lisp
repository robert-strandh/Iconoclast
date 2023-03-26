(cl:in-package #:iconoclast-builder)

(define-make-node-method :multiple-value-bind ico:multiple-value-bind-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :values-form))
     (left ico:multiple-value-bind-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:multiple-value-bind-ast)
     (right ico:variable-name-ast)
     &key)
  (reinitialize-instance left
    :variable-name-asts (append (ico:variable-name-asts left) (list right))))
  
