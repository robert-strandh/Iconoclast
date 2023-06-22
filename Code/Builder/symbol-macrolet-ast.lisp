(cl:in-package #:iconoclast-builder)

(define-make-node-method :symbol-macro-binding ico:symbol-expansion-ast)

(define-relations ico:symbol-expansion-ast
  ((:name ico:variable-name-ast ico:symbol-ast)
   (:expansion t ico:expansion-ast)))

(define-make-node-method :symbol-macrolet ico:symbol-macrolet-ast)

(define-relations ico:symbol-macrolet-ast
  ((:binding ico:symbol-expansion-ast ico:symbol-expansion-asts)))
