(cl:in-package #:iconoclast)

;;; This AST class can be used to represent a SETQ form with a single
;;; variable name and a single value form.  It is best to use if the
;;; variable is a lexical variable.  If it is a special variable, the
;;; AST class SPECIAL-VARIABLE-SETQ-AST can be used instead. 

(define-ast-class simple-setq-ast (ast)
  ((* value-ast)
   (* variable-name-ast)))
