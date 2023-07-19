(cl:in-package #:iconoclast-builder)

(define-make-node-method :flet ico:flet-ast)

(define-make-node-method :labels ico:labels-ast)

(define-make-node-method :macrolet ico:macrolet-ast)

(define-make-node-method :local-function-binding ico:local-function-ast)

(define-relations ico:local-function-ast
  ((:name ico:function-name-ast ico:name-ast)))
