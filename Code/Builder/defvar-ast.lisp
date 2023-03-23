(cl:in-package #:iconoclast-builder)

(define-make-node-method :defvar ico:defvar-ast)

(define-make-node-method :defparameter ico:defparameter-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:defvar-or-defparameter-ast)
     (right ico:variable-name-ast)
     &key)
  (reinitialize-instance left
    :variable-name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :initial-value))
     (left ico:defvar-or-defparameter-ast)
     (right unparsed-form-ast)
     &key)
  (reinitialize-instance left
    :form-ast right))
