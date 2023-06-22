(cl:in-package #:iconoclast-builder)

(define-make-node-method :shiftf ico:shiftf-ast)

(define-relations ico:shiftf-ast
  ((:new-value t ico:form-ast)))
