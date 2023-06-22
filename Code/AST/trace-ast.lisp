(cl:in-package #:iconoclast)

(defgeneric function-name-asts (ast))

(define-ast-class function-name-asts-mixin ()
  ((* function-name-asts)))

(define-ast-class trace-ast (function-name-asts-mixin ast)
  ())

(define-ast-class untrace-ast (function-name-asts-mixin ast)
  ())
