(cl:in-package #:iconoclast-builder)

(define-make-node-method :quote ico:quote-ast)

(define-relations ico:quote-ast
  ((:material t ico:object-ast)))
