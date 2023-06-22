(cl:in-package #:iconoclast-builder)

(define-make-node-method :with-open-stream ico:with-open-stream-ast)

(define-relations ico:with-open-stream-ast
  ((:var t ico:variable-name-ast)
   (:stream t ico:stream-ast)))
