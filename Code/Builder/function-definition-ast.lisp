(cl:in-package #:iconoclast-builder)

(define-make-node-method :lambda-expression ico:function-definition-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :lambda-list))
     (left ico:function-definition-ast)
     (right ico:lambda-list-ast)
     &key)
  (reinitialize-instance left
    :lambda-list right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:function-definition-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts (append (ico:form-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :default))
     (left ico:init-form-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :init-form-ast right))
