(cl:in-package #:iconoclast)

;;; This AST class is used in conjunction with the
;;; TAGBODY-WITH-VARIABLE-AST when the shared variable between TAGBODY
;;; and GO must be made explicit, typically as a prerequisite for
;;; closure conversion at the AST level.  The slot
;;; VARIABLE-REFERENCE-AST contains a reference to the shared
;;; variable, and the slot INDEX-AST contains a literal with a small
;;; non-negative integer, corresponding to the position of the GO tag
;;; in the TAGBODY.

(define-ast-class go-with-variable-ast (go-ast)
  ((1 variable-reference-ast)
   (1 index-ast)))
