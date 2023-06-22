(cl:in-package #:iconoclast-builder)

(define-make-node-method :do-symbols ico:do-symbols-ast)

(define-make-node-method :do-external-symbols ico:do-external-symbols-ast)

(define-relations ico:do-symbols-do-external-symbols-ast
  ((:package t ico:package-ast)
   (:variable t ico:variable-name-ast)))
