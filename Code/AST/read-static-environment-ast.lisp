(cl:in-package #:iconoclast)

;;; This AST class is introduced by closure conversion.  The value of
;;; a shared variable can be accessed by the use of an AST of this
;;; class.

(define-ast-class read-static-environment-ast (ast)
  (;; This slot contains a VARIABLE-REFERENCE-AST referring to the
   ;; static environment.
   (1 static-environment-ast)
   ;; This slot contains a LITERAL-AST representing a non-negative
   ;; integer that is a reference to an element of the the static
   ;; environment of the immediately enclosing LOCAL-FUNCTION-AST.
   (1 index-ast)))
