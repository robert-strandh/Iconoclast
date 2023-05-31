(cl:in-package #:iconoclast-builder)

(define-make-node-method :value-binding ico:variable-binding-ast)

(define-make-node-method :let ico:let-ast)

(define-make-node-method :let* ico:let*-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:variable-binding-ast)
     (right ico:variable-name-ast)
     &key)
  (reinitialize-instance left
    :variable-name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :value))
     (left ico:variable-binding-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-ast right))
