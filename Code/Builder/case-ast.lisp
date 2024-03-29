(cl:in-package #:iconoclast-builder)

(define-make-node-method :case-normal-clause ico:case-normal-clause-ast)

(define-make-node-method :case-otherwise-clause ico:case-otherwise-clause-ast)

(defmethod abp:node-kind ((builder builder) (node ico:key-ast))
  :key)

(define-relations ico:case-normal-clause-ast
  ((:key t ico:key-asts)))

(defmethod abp:node-kind ((builder builder) (node ico:key-ast))
  :unparsed)

(defmethod abp:node-initargs ((builder builder) (node ico:key-ast))
  `(:expression ,(ico:key node) :context :key))

(define-relations ico:case-or-ecase-ast
  ((:keyform t ico:keyform-ast)))

(define-relations ico:ccase-ast
  ((:keyplace t ico:keyplace-ast)))

(define-make-node-method :case ico:case-ast)

(define-make-node-method :ecase ico:ecase-ast)

(define-make-node-method :ccase ico:ccase-ast)
