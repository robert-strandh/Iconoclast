(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :typecase-normal-clause ico:typecase-normal-clause-ast)

(define-make-node-method
    :typecase-otherwise-clause ico:typecase-otherwise-clause-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :type))
     (left ico:typecase-normal-clause-ast)
     (right t)
     &key)
  (reinitialize-instance left :type-specifier-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :keyform))
     (left ico:typecase-base-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :keyplace))
     (left ico:ctypecase-ast)
     (right t)
     &key)
  (reinitialize-instance left :place-ast right))

(define-make-node-method :typecase ico:typecase-ast)

(define-make-node-method :etypecase ico:etypecase-ast)

(define-make-node-method :ctypecase ico:ctypecase-ast)
