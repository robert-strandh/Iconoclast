(cl:in-package #:iconoclast-builder)

(define-make-node-method :restart-binding ico:restart-binding-ast)

(define-make-node-method :restart-bind ico:restart-bind-ast)

(defmethod abp:relate
    ((builer builder)
     (relation (eql :name))
     (left ico:restart-binding-ast)
     (right t)
     &key)
  (reinitialize-instance left :name-ast right))

(defmethod abp:relate
    ((builer builder)
     (relation (eql :function))
     (left ico:restart-binding-ast)
     (right t)
     &key)
  (reinitialize-instance left :function-form-ast right))

(defmethod abp:relate
    ((builer builder)
     (relation (eql :interactive-function))
     (left ico:restart-binding-ast)
     (right t)
     &key)
  (reinitialize-instance left :interactive-function-ast right))

(defmethod abp:relate
    ((builer builder)
     (relation (eql :report-function))
     (left ico:restart-binding-ast)
     (right t)
     &key)
  (reinitialize-instance left :report-function-ast right))

(defmethod abp:relate
    ((builer builder)
     (relation (eql :test-function))
     (left ico:restart-binding-ast)
     (right t)
     &key)
  (reinitialize-instance left :test-function-ast right))
