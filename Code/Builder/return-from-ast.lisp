(cl:in-package #:iconoclast-builder)

(define-make-node-method :return-from ico:return-from-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:return-from-ast)
     (right ico:block-name-ast)
     &key)
  ;; FIXME: this is not quite right.
  (reinitialize-instance left
    :block-ast right))
