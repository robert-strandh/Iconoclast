(cl:in-package #:iconoclast)

(define-ast-class function-name-asts-mixin ()
  ((* function-name-asts)))

(define-ast-class trace-ast (function-name-asts-mixin macro-form-ast)
  ())

(define-ast-class untrace-ast (function-name-asts-mixin macro-form-ast)
  ())
