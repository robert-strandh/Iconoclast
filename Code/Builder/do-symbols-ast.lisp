(cl:in-package #:iconoclast-builder)

(define-make-node-method :do-symbols ico:do-symbols-ast)

(define-make-node-method :do-external-symbols ico:do-external-symbols-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :package))
     (left ico:do-symbols-do-external-symbols-ast)
     (right t)
     &key)
  (reinitialize-instance left :package-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :variable))
     (left ico:do-symbols-do-external-symbols-ast)
     (right t)
     &key)
  (reinitialize-instance left :variable-name-ast right))
