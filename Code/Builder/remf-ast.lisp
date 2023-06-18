(cl:in-package #:iconoclast-builder)

(define-make-node-method :remf ico:remf-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :indicator))
     (left ico:remf-ast)
     (right t)
     &key)
  (reinitialize-instance left :indicator-ast right))
