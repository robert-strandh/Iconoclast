(cl:in-package #:iconoclast-builder)

(define-make-node-method :return-from ico:return-from-ast)

(define-relations ico:return-from-ast
  ((:name ico:block-name-ast ico:name-ast)
   (:result t ico:form-ast)))
