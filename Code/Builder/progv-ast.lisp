(cl:in-package #:iconoclast-builder)

(define-make-node-method :progv ico:progv-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :symbols))
     (left ico:progv-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :symbols-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :values))
     (left ico:progv-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :values-ast right))
