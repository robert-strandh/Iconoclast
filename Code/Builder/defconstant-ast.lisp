(cl:in-package #:iconoclast-builder)

(define-make-node-method :defconstant ico:defconstant-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :initial-value))
     (left ico:defconstant-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast right))
