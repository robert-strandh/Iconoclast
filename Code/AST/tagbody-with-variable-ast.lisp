(cl:in-package #:iconoclast)

;;; This AST class can be used as a replacement for the TAGBODY-AST
;;; when the sharing of a variable between TAGBODY and GO must be made
;;; explicit, typically as a prerequisite for closure conversion at
;;; the AST level.  Then, the TAGBODY-WITH-VARIABLE-AST is wrapped in
;;; a LET-TEMPORARY-AST that introduces a variable with a
;;; VARIABLE-DEFINITION-AST, and the TAGBODY-WITH-VARIABLE-AST then
;;; contains the corresponding VARIABLE-REFERENCE-AST.

(define-ast-class tagbody-with-variable-ast
    (segment-asts-mixin special-form-ast)
  ((1 variable-reference-ast)))
