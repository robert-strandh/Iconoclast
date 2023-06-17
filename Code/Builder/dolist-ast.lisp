(cl:in-package #:iconoclast-builder)

(define-make-node-method :dolist ico:dolist-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :list))
     (left ico:dolist-ast)
     (right t)
     &key)
  (reinitialize-instance left :list-form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :variable))
     (left ico:dolist-ast)
     (right t)
     &key)
  (reinitialize-instance left :variable-name-ast right))
