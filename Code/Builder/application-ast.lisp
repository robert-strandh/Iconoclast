(cl:in-package #:iconoclast-builder)

(define-make-node-method :application ico:application-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :function))
     (left ico:application-ast)
     (right t)
     &key)
  (reinitialize-instance left :function-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :argument))
     (left ico:application-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :argument-asts (append (ico:argument-asts left) right)))
