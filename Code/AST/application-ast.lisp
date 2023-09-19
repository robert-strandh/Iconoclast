(cl:in-package #:iconoclast)

(define-ast-class application-ast (function-form-ast)
  ((1 function-name-ast)
   (* argument-asts)))
