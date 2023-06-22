(cl:in-package #:iconoclast-builder)

(define-make-node-method :defconstant ico:defconstant-ast)

(define-relations ico:defconstant-ast
  ((:initial-value t ico:form-ast)))
