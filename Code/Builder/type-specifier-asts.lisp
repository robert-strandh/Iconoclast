(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :type-name))
     &key source name)
  (make-instance 'ico:type-name-ast
    :origin source
    :name name))

(define-make-node-method :atomic-type-specifier ico:atomic-type-specifier-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:atomic-type-specifier-ast)
     (right ico:type-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :subsidiary-item))
     &key source value)
  (make-instance 'ico:subsidiary-item-ast
    :origin source
    :value value))

(define-make-node-method :compound-type-specifier ico:compound-type-specifier-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:compound-type-specifier-ast)
     (right ico:type-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :argument))
     (left ico:compound-type-specifier-ast)
     (right ico:subsidiary-item-ast)
     &key)
  (reinitialize-instance left
    :subsidiary-item-asts
    (append (ico:subsidiary-item-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :argument))
     (left ico:compound-type-specifier-ast)
     (right ico:atomic-type-specifier-ast)
     &key)
  (reinitialize-instance left
    :atomic-type-specifier-ast right))
