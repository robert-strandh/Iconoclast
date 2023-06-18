(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :print-unreadable-object ico:print-unreadable-object-ast)

(defmethod abp:relate
    ((builder builder)
     (kind (eql :stream))
     (left ico:print-unreadable-object-ast)
     (right t)
     &key)
  (reinitialize-instance left :stream-ast right))

(defmethod abp:relate
    ((builder builder)
     (kind (eql :type))
     (left ico:print-unreadable-object-ast)
     (right t)
     &key)
  (reinitialize-instance left :type-ast right))

(defmethod abp:relate
    ((builder builder)
     (kind (eql :identity))
     (left ico:print-unreadable-object-ast)
     (right t)
     &key)
  (reinitialize-instance left :identity-ast right))
