(cl:in-package #:iconoclast-builder)

(define-make-node-method :unwind-protect ico:unwind-protect-ast)

(define-relations ico:unwind-protect-ast
  ((:protected t ico:protected-form-ast)
   (:cleanup t ico:form-asts)))
