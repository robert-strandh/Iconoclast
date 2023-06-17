(cl:in-package #:iconoclast-builder)

(define-make-node-method :pprint-logical-block ico:pprint-logical-block-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :stream-symbol))
     (left ico:pprint-logical-block-ast)
     (right t)
     &key)
  (reinitialize-instance left :stream-symbol-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :prefix))
     (left ico:pprint-logical-block-ast)
     (right t)
     &key)
  (reinitialize-instance left :prefix-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :per-line-prefix))
     (left ico:pprint-logical-block-ast)
     (right t)
     &key)
  (reinitialize-instance left :per-line-prefix-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :suffix))
     (left ico:pprint-logical-block-ast)
     (right t)
     &key)
  (reinitialize-instance left :suffix-ast right))
