(cl:in-package #:iconoclast-builder)

(define-make-node-method :multiple-value-call ico:multiple-value-call-ast)

(define-relations ico:multiple-value-call-ast
  ((:function-form t ico:function-form-ast)
   (:argument t ico:form-asts)))
