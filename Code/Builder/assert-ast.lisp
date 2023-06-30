(cl:in-package #:iconoclast-builder)

(define-make-node-method :assert ico:assert-ast)

(define-relations ico:assert-ast
  ((:test t ico:test-form-ast)
   (:place t ico:place-asts)
   (:datum t ico:datum-form-ast)
   (:argument t ico:argument-form-asts)))
