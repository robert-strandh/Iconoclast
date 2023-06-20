(cl:in-package #:iconoclast-builder)

(define-make-node-method :handler-clause ico:handler-clause-ast)

(define-make-node-method :no-error-clause ico:no-error-clause-ast)

(define-make-node-method :handler-case ico:handler-case-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :type))
     (left ico:handler-clause-ast)
     (right t)
     &key)
  (reinitialize-instance left :type-specifier-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :variable))
     (left ico:handler-clause-ast)
     (right t)
     &key)
  (reinitialize-instance left :variable-name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:handler-case-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :no-error-clause))
     (left ico:handler-case-ast)
     (right t)
     &key)
  (reinitialize-instance left :no-error-clause-ast right))
