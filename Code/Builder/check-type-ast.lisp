(cl:in-package #:iconoclast-builder)

(define-make-node-method :check-type ico:check-type-ast)

(define-relations ico:check-type-ast
  ((:place t ico:place-ast)
   (:type t ico:typespec-ast)
   (:description t ico:description-ast)))
