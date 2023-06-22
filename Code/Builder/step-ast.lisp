(cl:in-package #:iconoclast-builder)

(define-make-node-method :step ico:step-ast)

(define-relations ico:step-ast
  ((:form t ico:form-ast)))
