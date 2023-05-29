(cl:in-package #:iconoclast-builder)

(define-make-node-method :handler-binding ico:handler-binding-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :type))
     (left ico:handler-binding-ast)
     (right t)
     &key)
  (reinitialize-instance left :type-specifier-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:handler-binding-ast)
     (right t)
     &key)
  (reinitialize-instance left :form-ast right))

(define-make-node-method :handler-bind ico:handler-bind-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :binding))
     (left ico:handler-bind-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :handler-binding-asts
    (append (ico:handler-binding-asts left) (list right))))

