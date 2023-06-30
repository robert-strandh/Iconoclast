(cl:in-package #:iconoclast-builder)

(define-make-node-method :application ico:application-ast)

(define-relations ico:application-ast
  ((:function-name t ico:function-name-ast)
   (:argument t ico:argument-asts)))
