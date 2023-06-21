(cl:in-package #:iconoclast)

(define-ast-class function-call-ast (ast)
  ((1 function-name-ast)
   (* argument-asts)))
