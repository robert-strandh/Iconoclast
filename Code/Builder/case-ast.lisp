(cl:in-package #:iconoclast-builder)

(define-make-node-method :case-normal-clause ico:case-normal-clause-ast)

(define-make-node-method :case-otherwise-clause ico:case-otherwise-clause-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :key))
     (left ico:case-normal-clause-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :key-asts (append (ico:key-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :keyform))
     (left ico:case-or-ecase-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :keyplace))
     (left ico:ccase-ast)
     (right t)
     &key)
  (reinitialize-instance left :place-ast right))

(define-make-node-method :case ico:case-ast)

(define-make-node-method :ecase ico:ecase-ast)

(define-make-node-method :ccase ico:ccase-ast)
