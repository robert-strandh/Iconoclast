(cl:in-package #:iconoclast-builder)

(define-make-node-method :application ico:application-ast)

(define-relations ico:application-ast
  ((:function t ico-function-ast)
   (:argument t ico-argument-asts)))
