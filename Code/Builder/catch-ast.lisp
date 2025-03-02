(cl:in-package #:iconoclast-builder)

(define-make-node-method :catch ico:catch-ast)

(define-relations ico:catch-ast
  ((:tag-form t ico:tag-form-ast)
   (:form t ico:form-asts)))

(define-make-node-method :throw ico:throw-ast)

(define-relations ico:throw-ast
  ((:tag-form t ico:tag-form-ast)
   (:result-form t ico:form-ast)))
