(cl:in-package #:iconoclast)

;;; FIXME: This AST class does not seem to be used.  Maybe
;;; APPLICATION-AST is used instead.
(define-ast-class function-call-ast (function-form-ast)
  ((1 function-name-ast)
   (* argument-asts)))
