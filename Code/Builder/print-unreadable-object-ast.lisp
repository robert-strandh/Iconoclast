(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :print-unreadable-object ico:print-unreadable-object-ast)

(define-relations ico:print-unreadable-object-ast
  ((:stream t ico:stream-ast)
   (:type t ico:type-ast)
   (:identity t ico:identity-ast)))
