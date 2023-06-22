(cl:in-package #:iconoclast-builder)

(define-make-node-method :trace ico:trace-ast)

(define-make-node-method :untrace ico:untrace-ast)

(define-relations ico:function-name-asts-mixin
  ((:function-name t ico:function-name-asts)))
