(cl:in-package #:iconoclast-builder)

(define-make-node-method :multiple-value-bind ico:multiple-value-bind-ast)

(define-relations ico:multiple-value-bind-ast
  ((:values-form t ico:form-ast)
   (:name ico:variable-name-ast ico:variable-name-asts)))
