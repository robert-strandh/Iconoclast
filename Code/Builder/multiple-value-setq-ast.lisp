(cl:in-package #:iconoclast-builder)

(define-make-node-method :multiple-value-setq ico:multiple-value-setq-ast)

(define-relations ico:multiple-value-setq-ast
  ((:name t ico:name-asts)
   (:values t ico:values-ast)))
  
