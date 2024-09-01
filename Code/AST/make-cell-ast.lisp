(cl:in-package #:iconoclast)

;;; This AST class is introduced by closure conversion.  It creates a
;;; cell to be used to hold some value.  The FORM-AST slot typically
;;; contains a VARIABLE-REFERENCE-AST to a variable that was shared
;;; before closure conversion.

(define-ast-class make-cell-ast (form-ast-mixin ast)
  ())
