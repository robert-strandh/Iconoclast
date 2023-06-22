(cl:in-package #:iconoclast-builder)

(define-make-node-method :variable-name ico:variable-name-ast)

(define-make-node-method :type-name ico:type-name-ast)

(define-make-node-method :function-name ico:function-name-ast)

(defmethod abp:node-initargs
    ((builder builder)
     (ast ico:name-ast))
  (list :name (ico:name ast)))
