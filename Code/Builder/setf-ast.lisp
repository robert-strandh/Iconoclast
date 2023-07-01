(cl:in-package #:iconoclast-builder)

(define-make-node-method :setf ico:setf-ast)

(define-make-node-method :psetf ico:psetf-ast)

(define-relations ico:setf-or-psetf-ast
  ((:new-value t ico:new-value-asts)))
