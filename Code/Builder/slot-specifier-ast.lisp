(cl:in-package #:iconoclast-builder)

(define-make-node-method :slot-specifier ico:slot-specifier-ast)

(define-make-node-method :condition-slot-specifier ico:slot-specifier-ast)

(define-relations ico:slot-specifier-ast
  ((:name ico:variable-name-ast ico:name-ast)
  (:initarg-name ico:initarg-name-ast ico:initarg-asts)
  (:initarg ico:initarg-name-ast ico:initarg-asts)
  (:type t ico:type-specifier-ast)
  (:reader t ico:reader-asts)
  (:writer t ico:writer-asts)
  (:accessor t ico:accessor-asts)
  (:allocation t ico:allocation)))
