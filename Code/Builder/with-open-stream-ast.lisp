(cl:in-package #:iconoclast-builder)

(define-make-node-method :with-open-stream ico:with-open-stream-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :var))
     (left ico:with-open-stream-ast)
     (right t)
     &key)
  (reinitialize-instance left :variable-name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :stream))
     (left ico:with-open-stream-ast)
     (right t)
     &key)
  (reinitialize-instance left :stream-ast right))
