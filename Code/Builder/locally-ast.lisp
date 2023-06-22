(cl:in-package #:iconoclast-builder)

(define-make-node-method :locally ico:locally-ast)

(define-relations ico:locally-ast
  ((:form t ico:form-asts)))
