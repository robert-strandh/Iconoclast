(cl:in-package #:iconoclast)

;;; This AST class is introduced by closure conversion.  It has a slot
;;; containing a FUNCTION-REFERENCE-AST referring to a local function.
;;; And it has a slot containing a list of ASTs to be evaluated to
;;; produce an element of the static environment.  An element of the
;;; list is typically either a VARIABLE-REFERENCE-AST or a
;;; MAKE-CELL-AST.

(define-ast-class set-static-environment-ast
    (form-asts-mixin
     ast)
  ((1 function-reference-ast)))
