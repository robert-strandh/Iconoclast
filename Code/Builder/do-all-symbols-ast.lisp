(cl:in-package #:iconoclast-builder)

(define-make-node-method :do-all-symbols ico:do-all-symbols-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :variable))
     (left ico:do-all-symbols-ast)
     (right t)
     &key)
  (reinitialize-instance left :variable-name-ast right))
