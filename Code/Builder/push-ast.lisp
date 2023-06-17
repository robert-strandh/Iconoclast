(cl:in-package #:iconoclast-builder)

(define-make-node-method :push ico:push-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :item))
     (left ico:push-ast)
     (right t)
     &key)
  (reinitialize-instance left :item-ast right))
