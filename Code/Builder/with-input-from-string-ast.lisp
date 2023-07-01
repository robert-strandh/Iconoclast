(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :with-input-from-string ico:with-input-from-string-ast)

(define-relations ico:with-input-from-string-ast
  ((:var t ico:var-ast)
   (:string t ico:string-ast)
   (:index t ico:index-ast)
   (:start t ico:start-ast)
   (:end t ico:end-ast)))
