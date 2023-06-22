(cl:in-package #:iconoclast-builder)

(define-make-node-method :progv ico:progv-ast)

(define-relations ico:progv-ast
  ((:symbols t ico:symbols-ast)
   (:values t ico:values-ast)))
