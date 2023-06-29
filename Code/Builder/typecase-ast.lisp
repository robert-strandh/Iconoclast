(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :typecase-normal-clause ico:typecase-normal-clause-ast)

(define-make-node-method
    :typecase-otherwise-clause ico:typecase-otherwise-clause-ast)

(define-relations ico:typecase-normal-clause-ast
  ((:type t ico:type-specifier-ast)))

(define-relations ico:typecase-base-ast
  ((:clause t ico:clause-asts)))

(define-relations ico:typecase-or-etypecase-ast
  ((:keyform t ico:keyform-ast)))

(define-relations ico:ctypecase-ast
  ((:keyplace t ico:place-ast)))

(define-make-node-method :typecase ico:typecase-ast)

(define-make-node-method :etypecase ico:etypecase-ast)

(define-make-node-method :ctypecase ico:ctypecase-ast)
