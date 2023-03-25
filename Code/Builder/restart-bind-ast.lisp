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
     (relation (eql :binding))
     (left ico:restart-bind-ast)
     (right ico:restart-binding-ast)
     &key)
  (reinitialize-instance left
    :restart-binding-asts
    (append (ico:restart-binding-asts left) (list right))))
