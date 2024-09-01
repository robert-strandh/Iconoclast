(cl:in-package #:iconoclast)

(define-ast-class write-cell-ast (form-ast-mixin ast)
  (;; This slot contains a FORM-AST that evaluates to a cell,
   ;; typically either a VARIABLE-REFERENCE-AST or a
   ;; STATIC-ENVIRONMENT-REFERENCE-AST.
   (1 cell-ast)))
