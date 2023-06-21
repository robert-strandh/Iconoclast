(cl:in-package #:iconoclast)

;;; FIXME: is this one the same as FUNCTION-CALL-AST?

(define-ast-class application-ast (ast)
  ((1 function-ast)
   (* argument-asts)))
