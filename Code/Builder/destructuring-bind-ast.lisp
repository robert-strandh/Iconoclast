(cl:in-package #:iconoclast-builder)

(define-make-node-method :destructuring-bind ico:destructuring-bind-ast)

(define-relations ico:destructuring-bind-ast
  ((:expression t ico:form-ast)))
