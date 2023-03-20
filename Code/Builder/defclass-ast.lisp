(cl:in-package #:iconoclast-builder)

(define-make-node-method :slot-specifier ico:slot-specifier-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:slot-specifier-ast)
     (right ico:variable-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))

(define-make-node-method :defclass ico:defclass-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:defclass-ast)
     (right ico:type-name-ast)
     &key)
  (reinitialize-instance left :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :slot))
     (left ico:defclass-ast)
     (right ico:slot-specifier-ast)
     &key)
  (reinitialize-instance left
    :slot-specifier-asts (append (ico:slot-specifier-asts left) (list right))))

