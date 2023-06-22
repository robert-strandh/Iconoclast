(cl:in-package #:iconoclast-builder)

(define-make-node-method :atomic-type-specifier ico:atomic-type-specifier-ast)

(define-relations ico:atomic-type-specifier-ast
  ((:name ico:type-name-ast ico:name-ast)))

(define-make-node-method :subsidiary-item ico:subsidiary-item-ast)

(define-make-node-method :compound-type-specifier ico:compound-type-specifier-ast)

(define-relations ico:compound-type-specifier-ast
  ((:name ico:type-name-ast ico:name-ast)
   (:argument ico:subsidiary-item-ast ico:subsidiary-item-asts)
   (:argument ico:atomic-type-specifier-ast ico:atomic-type-specifier-ast)))
