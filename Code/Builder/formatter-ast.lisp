(cl:in-package #:iconoclast-builder)

(define-make-node-method :formatter ico:formatter-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :control-string))
     (left ico:formatter-ast)
     (right t)
     &key)
  (reinitialize-instance left :control-string-ast right))
