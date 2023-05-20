(cl:in-package #:iconoclast-builder)

(define-make-node-method :condition-report ico:condition-report-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :function))
     (left ico:condition-report-ast)
     (right t)
     &key)
  (reinitialize-instance left :argument-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :lambda))
     (left ico:condition-report-ast)
     (right t)
     &key)
  (reinitialize-instance left :argument-ast right))

(define-make-node-method :define-condition ico:define-condition-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :report))
     (left ico:define-condition-ast)
     (right t)
     &key)
  (reinitialize-instance left :report-ast right))
