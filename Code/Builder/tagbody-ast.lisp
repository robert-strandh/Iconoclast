(cl:in-package #:iconoclast-builder)

(define-make-node-method :tagbody ico:tagbody-ast)

(define-make-node-method :tagbody-segment ico:tagbody-segment-ast)

(define-make-node-method :tag ico:tag-ast)

(define-relations ico:tagbody-segment-ast
  ((:label ico:tag-ast ico:tag-ast)
   (:statement t ico:statement-asts)))
