(cl:in-package #:iconoclast-builder)

(define-make-node-method :setf ico:setf-ast)

(define-make-node-method :psetf ico:psetf-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :place))
     (left ico:setf-or-psetf-ast)
     (right ico:place-ast)
     &key)
  (reinitialize-instance left
    :place-asts (append (ico:place-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :new-value))
     (left ico:setf-or-psetf-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts (append (ico:form-asts left) (list right))))
