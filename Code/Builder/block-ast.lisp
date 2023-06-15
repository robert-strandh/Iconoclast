(cl:in-package #:iconoclast-builder)

(define-make-node-method :block ico:block-ast)

(define-make-node-method :block-name ico:block-name-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:block-ast)
     (right t)
     &key)
  (reinitialize-instance left
    ;; We need source information
    ;; for the name, no?
    :name-ast right))
