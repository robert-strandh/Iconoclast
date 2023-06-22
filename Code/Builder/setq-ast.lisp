(cl:in-package #:iconoclast-builder)

(define-make-node-method :setq ico:setq-ast)

(define-make-node-method :psetq ico:psetq-ast)

(define-relations ico:setq-or-psetq-ast
  ((:name ico:variable-name-ast ico:variable-name-asts)
   (:value-form t ico:form-asts)))
