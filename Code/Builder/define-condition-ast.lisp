(cl:in-package #:iconoclast-builder)

(define-make-node-method :condition-report ico:condition-report-ast)

(define-relations ico:condition-report-ast
  ((:function t ico:argument-ast)
   (:lambda t ico:argument-ast)
   (:string t ico:argument-ast)))

(define-make-node-method :define-condition ico:define-condition-ast)

(define-relations ico:define-condition-ast
  ((:parent-type t ico:parent-type-asts)
   (:report t ico:report-ast)))
