(cl:in-package #:iconoclast-builder)

(define-make-node-method :push ico:push-ast)

(define-relations ico:push-ast
  ((:item t ico:item-ast)))
