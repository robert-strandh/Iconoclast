(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :do-iteration-variable ico:do-iteration-variable-ast)

(define-make-node-method :do ico:do-ast)

(define-make-node-method :do* ico:do*-ast)

;;; FIXME: :INIT is a bad choice for the relation.
(define-relations ico:do-iteration-variable-ast
  ((:variable t ico:do-variable-name-ast)
   (:init t ico:init-form-ast)
   (:step t ico:step-form-ast)))

(define-relations ico:do-do*-ast
  ((:variable t ico:do-iteration-variable-asts)
   (:end-test t ico:end-test-ast)))
