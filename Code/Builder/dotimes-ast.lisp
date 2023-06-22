(cl:in-package #:iconoclast-builder)

(define-make-node-method :dotimes ico:dotimes-ast)

(define-relations ico:dotimes-ast
  ((:count t ico:count-form-ast)
   (:variable t ico:variable-name-ast)))
