(cl:in-package #:iconoclast-builder)

(define-make-node-method :if ico:if-ast)

(define-relations ico:if-ast
  ((:then t ico:then-ast)
   (:else t ico:else-ast)))
