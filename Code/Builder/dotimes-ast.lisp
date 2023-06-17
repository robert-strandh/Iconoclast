(cl:in-package #:iconoclast-builder)

(define-make-node-method :dotimes ico:dotimes-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :count))
     (left ico:dotimes-ast)
     (right t)
     &key)
  (reinitialize-instance left :count-form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :variable))
     (left ico:dotimes-ast)
     (right t)
     &key)
  (reinitialize-instance left :variable-name-ast right))
