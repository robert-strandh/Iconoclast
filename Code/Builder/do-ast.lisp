(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :do-iteration-variable ico:do-iteration-variable-ast)

(define-make-node-method :do ico:do-ast)

(define-make-node-method :do* ico:do*-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :variable))
     (left ico:do-iteration-variable-ast)
     (right t)
     &key)
  (reinitialize-instance left :variable-name-ast right))

;;; FIXME: :INIT is a back choice for the relation.

(defmethod abp:relate
    ((builder builder)
     (relation (eql :init))
     (left ico:do-iteration-variable-ast)
     (right t)
     &key)
  (reinitialize-instance left :init-form-ast right))

;;; FIXME: :STEP is a back choice for the relation.

(defmethod abp:relate
    ((builder builder)
     (relation (eql :step))
     (left ico:do-iteration-variable-ast)
     (right t)
     &key)
  (reinitialize-instance left :step-form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :variable))
     (left ico:do-do*-ast)
     (right t)
     &key)
  (reinitialize-instance
      left :do-iteration-variable-asts
      (append (ico:do-iteration-variable-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :end-test))
     (left ico:do-do*-ast)
     (right t)
     &key)
  (reinitialize-instance left :end-test-ast right))
