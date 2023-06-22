(cl:in-package #:iconoclast-builder)

(define-make-node-method :function ico:function-ast)

(define-relations ico:function-ast
  ((:name ico:function-name-ast ico:name-ast)
   (:lambda t ico:name-ast)))
