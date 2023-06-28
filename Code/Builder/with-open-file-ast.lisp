(cl:in-package #:iconoclast-builder)

(define-make-node-method :with-open-file ico:with-open-file-ast)

(define-relations ico:with-open-file-ast
  ((:stream t ico:stream-ast)
   (:filespec t ico:filespec-ast)
   (:option t ico:option-asts)))
