(cl:in-package #:iconoclast)

;;; This AST class is introduced by closure conversion.  The value of
;;; the AST is the static environment of the current function.  It is
;;; used as the FORM-AST of a LET-TEMPORARY-AST introducing a lexical
;;; variable holding the static environment.

(define-ast-class static-environment-ast (ast)
  ())
