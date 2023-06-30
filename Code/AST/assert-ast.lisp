(cl:in-package #:iconoclast)

(define-ast-class assert-ast (ast)
  ((1 test-form-ast)
   (* place-asts)
   (? datum-form-ast)
   (* argument-form-asts)))
