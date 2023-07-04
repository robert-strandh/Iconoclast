(cl:in-package #:iconoclast-builder)

(define-make-node-method :multiple-value-bind ico:multiple-value-bind-ast)

(define-relations ico:multiple-value-bind-ast
  ((:values t ico:values-ast)
   (:name ico:variable-name-ast ico:variable-name-asts)))
