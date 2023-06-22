(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :with-output-to-string ico:with-output-to-string-ast)

(define-relations ico:with-output-to-string-ast
  ((:var t ico:variable-name-ast)
   (:string t ico:string-ast)
   (:element-type t ico:element-type-ast)))
