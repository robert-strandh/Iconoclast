(cl:in-package #:iconoclast-builder)

(define-make-node-method :handler-binding ico:handler-binding-ast)

(define-relations ico:handler-binding-ast
  ((:type t ico:type-specifier-ast)
   (:form t ico:form-ast)))

(define-make-node-method :handler-bind ico:handler-bind-ast)
