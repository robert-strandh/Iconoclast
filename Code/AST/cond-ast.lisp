(cl:in-package #:iconoclast)

(defclass cond-clause-ast (test-ast-mixin form-asts-mixin ast)
  ())

(defclass cond-ast (clause-asts-mixin ast)
  ())
