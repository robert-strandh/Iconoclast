(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :typecase-normal-clause ico:typecase-normal-clause-ast)

(define-make-node-method :typecase ico:typecase-ast)

(define-make-node-method :etypecase ico:etypecase-ast)

(define-make-node-method :ctypecase ico:ctypecase-ast)
