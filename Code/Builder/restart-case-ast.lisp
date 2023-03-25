(cl:in-package #:iconoclast-builder)

(define-make-node-method :restart-clause ico:restart-clause-ast)

(define-make-node-method :restart-case ico:restart-case-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:restart-clause-ast)
     (right t)
     &key)
  (reinitialize-instance left :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:restart-case-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :clause))
     (left ico:restart-case-ast)
     (right ico:restart-clause-ast)
     &key)
  (reinitialize-instance left
    :clause-asts (append (ico:clause-asts left) (list right))))
