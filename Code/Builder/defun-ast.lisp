(cl:in-package #:iconoclast-builder)

(define-make-node-method :defun ico:defun-ast)

(define-relations ico:defun-ast
  ((:name ico:function-name-ast ico:name-ast)))
