(cl:in-package #:iconoclast-builder)

(define-make-node-method :pushnew ico:pushnew-ast)

(define-relations ico:pushnew-ast
  ((:item t ico:item-ast)
   (:key t ico:key-ast)
   (:test t ico:test-ast)
   (:test-not t ico:test-not-ast)))
