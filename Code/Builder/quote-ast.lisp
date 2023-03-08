(cl:in-package #:iconoclast-builder)

(define-make-node-method :quote ico:quote-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :material))
     (left ico:quote-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :object-ast right))
