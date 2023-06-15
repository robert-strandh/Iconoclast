(cl:in-package #:iconoclast-builder)

(define-make-node-method :variable-name ico:variable-name-ast)

(defmethod abp:node-kind
    ((builder builder) (node ico:variable-name-ast))
  :variable-name)

(define-make-node-method :type-name ico:type-name-ast)

(defmethod abp:node-kind
    ((builder builder) (node ico:type-name-ast))
  :type-name)

(define-make-node-method :function-name ico:function-name-ast)

(defmethod abp:node-kind
    ((builder builder) (node ico:function-name-ast))
  :function-name)

(defmethod abp:node-initargs
    ((builder builder)
     (ast ico:name-ast))
  (list :name (ico:name ast)))
