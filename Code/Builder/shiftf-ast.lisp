(cl:in-package #:iconoclast-builder)

(define-make-node-method :shiftf ico:shiftf-ast)

(define-relations ico:shiftf-ast
  ((:value t ico:value-ast)))
