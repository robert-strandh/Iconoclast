(cl:in-package #:iconoclast-builder)

(define-make-node-method :cond-clause ico:cond-clause-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :test-form))
     (left ico:cond-clause-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :test-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :forms))
     (left ico:cond-clause-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts (append (ico:form-asts left) (list right))))

(define-make-node-method :cond ico:cond-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :clauses))
     (left ico:cond-ast)
     (right ico:cond-clause-ast)
     &key)
  (reinitialize-instance left
    :clause-asts (append (ico:clause-asts left) (list right))))
