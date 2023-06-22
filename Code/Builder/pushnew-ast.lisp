(cl:in-package #:iconoclast-builder)

(define-make-node-method :pushnew ico:pushnew-ast)

(define-relations ico:pushnew-ast
  ((:item t ico:item-ast)))
