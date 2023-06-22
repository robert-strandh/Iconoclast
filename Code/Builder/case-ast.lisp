(cl:in-package #:iconoclast-builder)

(define-make-node-method :case-normal-clause ico:case-normal-clause-ast)

(define-make-node-method :case-otherwise-clause ico:case-otherwise-clause-ast)

(define-relations ico:case-normal-clause-ast
  ((:key t ico:key-asts)))

(define-relations ico:case-or-ecase-ast
  ((:keyform t ico:form-ast)))

(define-relations ico:ccase-ast
  ((:keyplace t ico:place-ast)))

(define-make-node-method :case ico:case-ast)

(define-make-node-method :ecase ico:ecase-ast)

(define-make-node-method :ccase ico:ccase-ast)
