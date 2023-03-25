(cl:in-package #:iconoclast-builder)

(define-make-node-method :in-package ico:in-package-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:in-package-ast)
     (right t)
     &key)
  (reinitialize-instance left :name-ast right))
