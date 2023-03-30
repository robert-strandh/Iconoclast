(cl:in-package #:iconoclast-builder)

(define-make-node-method :destructuring-bind ico:destructuring-bind-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :expression))
     (left ico:destructuring-bind-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast right))
