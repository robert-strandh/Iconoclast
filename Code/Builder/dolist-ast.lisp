(cl:in-package #:iconoclast-builder)

(define-make-node-method :dolist ico:dolist-ast)

(define-relations ico:dolist-ast
  ((:list t ico:list-form-ast)
   (:variable t ico:variable-name-ast)))
