(cl:in-package #:iconoclast-builder)

(define-make-node-method :value-binding ico:variable-binding-ast)

(define-make-node-method :let ico:let-ast)

(define-make-node-method :let* ico:let*-ast)

(define-relations ico:variable-binding-ast
  ((:name ico:variable-name-ast ico:variable-name-ast)
   (:value t ico:form-ast)))
