(cl:in-package #:iconoclast-builder)

(define-make-node-method :load-time-value ico:load-time-value-ast)

(define-relations ico:load-time-value-ast
  ((:form t ico:form-ast)
   (:read-only-p t ico:read-only-p-ast)))
