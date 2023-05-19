(cl:in-package #:iconoclast-builder)

(define-make-node-method :slot-specifier ico:slot-specifier-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:slot-specifier-ast)
     (right ico:variable-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :initarg-name))
     &key name source)
  (make-instance 'ico:initarg-name-ast
    :origin source
    :name name))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :initarg))
     (left ico:slot-specifier-ast)
     (right ico:initarg-name-ast)
     &key)
  (reinitialize-instance left :name-ast right))
