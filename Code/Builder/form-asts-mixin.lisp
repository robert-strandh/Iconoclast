(cl:in-package #:iconoclast-builder)

(define-relations ico:form-asts-mixin
  ((:form t ico:form-asts)))

;;; FIXME: :REST is a poor choice.

(define-relations ico:prog1-ast
  ((:rest t ico:form-asts)))

(define-relations ico:prog2-ast
  ((:rest t ico:form-asts)))
