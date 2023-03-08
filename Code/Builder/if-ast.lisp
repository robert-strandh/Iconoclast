(cl:in-package #:iconoclast-builder)

(define-make-node-method :IF ico:if-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :then))
     (left ico:if-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :then-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :else))
     (left ico:if-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :else-ast right))
