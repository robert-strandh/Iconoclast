(cl:in-package #:iconoclast-builder)

(define-make-node-method :handler-clause ico:handler-clause-ast)

(define-make-node-method :no-error-clause ico:no-error-clause-ast)

(define-make-node-method :handler-case ico:handler-case-ast)

(define-relations ico:handler-clause-ast
  ((:type t ico:type-specifier-ast)
   (:variable t ico:variable-name-ast)))

(define-relations ico:handler-case-ast
  ((:form t ico:form-ast)
   (:no-error-clause t ico:no-error-clause-ast)))
