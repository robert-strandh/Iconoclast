(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :define-compiler-macro ico:define-compiler-macro-ast)

(define-relations ico:define-compiler-macro-ast
  ((:name t ico:name-ast)))
