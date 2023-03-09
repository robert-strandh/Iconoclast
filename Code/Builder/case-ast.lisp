(cl:in-package #:iconoclast-builder)

(define-make-node-method :case-normal-clause ico:case-normal-clause-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :key))
     (left ico:case-normal-clause-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :key-asts (append (ico:key-asts left) (list right))))
