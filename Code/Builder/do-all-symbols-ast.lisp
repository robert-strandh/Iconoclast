(cl:in-package #:iconoclast-builder)

(define-make-node-method :do-all-symbols ico:do-all-symbols-ast)

(define-relations ico:do-all-symbols-ast
  ((:variable t ico:variable-name-ast)))
