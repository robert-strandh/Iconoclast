(cl:in-package #:iconoclast)

(define-ast-class read-cell-ast (ast)
  (;; This slot contains a FORM-AST that evaluates to a cell,
   ;; typically either a VARIABLE-REFERENCE-AST or a
   ;; STATIC-ENVIRONMENT-REFERENCE-AST.
   (1 cell-ast)))
