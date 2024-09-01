(cl:in-package #:iconoclast)

;;; This AST class is introduced by closure conversion.  A reference
;;; to a shared variable is replaced by a reference to an element in
;;; the static environment.

(define-ast-class static-environment-reference (ast)
  (;; This slot contains a LITERAL-AST representing a non-negative
   ;; integer that is a reference to an element of the the static
   ;; environment of the immediately enclosing LOCAL-FUNCTION-AST.
   (1 index-ast)))
