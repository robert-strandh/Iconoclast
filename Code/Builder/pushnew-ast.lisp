(cl:in-package #:iconoclast-builder)

(define-make-node-method :pushnew ico:pushnew-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :item))
     (left ico:pushnew-ast)
     (right t)
     &key)
  (reinitialize-instance left :item-ast right))
