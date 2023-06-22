(cl:in-package #:iconoclast-builder)

(define-make-node-method :cond-clause ico:cond-clause-ast)

(define-relations ico:cond-clause-ast
  ((:test-form t ico:test-ast)
   (:forms t ico:form-asts)))

(define-make-node-method :cond ico:cond-ast)
