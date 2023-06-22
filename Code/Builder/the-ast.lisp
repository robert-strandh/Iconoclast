(cl:in-package #:iconoclast-builder)

(define-make-node-method :the ico:the-ast)

(define-relations ico:the-ast
  ((:type ico:type-specifier-ast ico:value-type-ast)
   (:form t ico:form-ast)))
