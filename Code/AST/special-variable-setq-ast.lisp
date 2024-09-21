(cl:in-package #:iconoclast)

;;; This AST class can be used to represent a SETQ form with a single
;;; variable name and a single value form.  It is best to use if the
;;; variable is a special variable.  If it is a lexical variable, the
;;; AST class SIMPLE-SETQ-AST can be used instead.

(define-ast-class special-variable-setq-ast (ast)
  ((1 value-ast)
   (1 variable-name-ast)))
