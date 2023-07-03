(cl:in-package #:iconoclast-builder)

(define-make-node-method :slot-specifier ico:slot-specifier-ast)

(define-make-node-method :condition-slot-specifier ico:slot-specifier-ast)

(define-make-node-method :initarg-name ico:initarg-name-ast)

(defmethod abp:node-kind ((builder builder) (node ico:initarg-name-ast))
  :initarg-name)

(defmethod abp:node-initargs ((builder builder) (node ico:initarg-name-ast))
  `(:name ,(ico:name node)))

(define-relations ico:slot-specifier-ast
  ((:name ico:variable-name-ast ico:name-ast)
  (:initarg ico:initarg-name-ast ico:initarg-name-asts)
  (:type t ico:type-specifier-ast)
  (:reader t ico:reader-asts)
  (:writer t ico:writer-asts)
  (:accessor t ico:accessor-asts)
  (:allocation t ico:allocation)))
