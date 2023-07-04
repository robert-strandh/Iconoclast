(cl:in-package #:iconoclast-builder)

(define-make-node-method :multiple-value-call ico:multiple-value-call-ast)

(define-relations ico:multiple-value-call-ast
  ((:function t ico:function-ast)
   (:argument t ico:form-asts)))
