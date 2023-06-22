(cl:in-package #:iconoclast-builder)

(define-make-node-method :block ico:block-ast)

(define-make-node-method :block-name ico:block-name-ast)

(define-relations ico:block-ast
  ((:name t ico:name-ast)))
