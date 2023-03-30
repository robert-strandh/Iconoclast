(cl:in-package #:iconoclast-builder)

(define-make-node-method :defmacro ico:defmacro-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:defmacro-ast)
     (right t)
     &key)
  (reinitialize-instance left :name-ast right))
