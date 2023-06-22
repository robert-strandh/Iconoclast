(cl:in-package #:iconoclast-builder)

(define-make-node-method :multiple-value-prog1 ico:multiple-value-prog1-ast)

(define-relations ico:multiple-value-prog1-ast
  ((:values-form t ico:first-form-ast)))
