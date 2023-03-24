(cl:in-package #:iconoclast-builder)

(define-make-node-method :setq ico:setq-ast)

(define-make-node-method :psetq ico:psetq-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:setq-or-psetq-ast)
     (right ico:variable-name-ast)
     &key)
  (reinitialize-instance left
    :variable-name-asts (append (ico:variable-name-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :value-form))
     (left ico:setq-or-psetq-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts (append (ico:form-asts left) (list right))))
