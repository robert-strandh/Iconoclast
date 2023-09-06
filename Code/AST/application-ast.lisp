(cl:in-package #:iconoclast)

;;; FIXME: is this one the same as FUNCTION-CALL-AST?

(define-ast-class application-ast (function-form-ast)
  ((1 function-name-ast)
   (* argument-asts)))
