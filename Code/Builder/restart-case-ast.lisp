(cl:in-package #:iconoclast-builder)

(define-make-node-method :restart-clause ico:restart-clause-ast)

(define-make-node-method :restart-case ico:restart-case-ast)

(define-relations ico:restart-clause-ast
  ((:name t ico:name-ast)
   (:report-lambda t ico:report-ast)
   (:report-name t ico:report-ast)
   (:report-string t ico:report-ast)
   (:interactive-name t ico:interactive-ast)
   (:interactive-lambda t ico:interactive-ast)
   (:test-name t ico:test-ast)
   (:test-lambda t ico:test-ast)
   (:form t ico:form-asts)))

(define-relations ico:restart-case-ast
  ((:clause ico:restart-clause-ast ico:clause-asts)))
