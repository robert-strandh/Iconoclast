(cl:in-package #:iconoclast)

;;; This AST class is introduced by closure conversion.  A SETQ-AST
;;; with a reference to a shared lexical variable is replaced by an
;;; instance of this AST class.

(define-ast-class write-cell-ast (required-form-ast-mixin ast)
  (;; This slot contains a FORM-AST that evaluates to a cell,
   ;; typically either a VARIABLE-REFERENCE-AST or a
   ;; STATIC-ENVIRONMENT-REFERENCE-AST.
   (1 cell-ast)))
