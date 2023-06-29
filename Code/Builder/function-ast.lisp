(cl:in-package #:iconoclast-builder)

(define-make-node-method :function ico:function-ast)

;;; FIXME: We hope that the s-expression-syntax library
;;; will have a single relation here.

(define-relations ico:function-ast
  ((:name ico:function-name-ast ico:name-ast)
   (:lambda t ico:name-ast)))
