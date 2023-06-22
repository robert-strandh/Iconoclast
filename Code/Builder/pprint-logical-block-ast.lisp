(cl:in-package #:iconoclast-builder)

(define-make-node-method :pprint-logical-block ico:pprint-logical-block-ast)

(define-relations ico:pprint-logical-block-ast
  ((:stream-symbol t ico:stream-symbol-ast)
   (:prefix t ico:prefix-ast)
   (:per-line-prefix t ico:per-line-prefix-ast)
   (:suffix t ico:suffix-ast)))
