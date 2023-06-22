(cl:in-package #:iconoclast-builder)

(define-make-node-method :formatter ico:formatter-ast)

(define-relations ico:formatter-ast
  ((:control-string t ico:control-string-ast)))
