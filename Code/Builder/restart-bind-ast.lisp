(cl:in-package #:iconoclast-builder)

(define-make-node-method :restart-binding ico:restart-binding-ast)

(define-make-node-method :restart-bind ico:restart-bind-ast)

(define-relations ico:restart-binding-ast
  ((:name t ico:name-ast)
   (:function t ico:function-form-ast)
   (:interactive-function t ico:interactive-function-ast)
   (:report-function t ico:report-function-ast)
   (:test-function t ico:test-function-ast)))
