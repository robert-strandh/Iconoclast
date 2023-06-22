(cl:in-package #:iconoclast-builder)

(define-make-node-method :return ico:return-ast)

(define-relations ico:return-ast
  ((:result t ico:form-ast)))
