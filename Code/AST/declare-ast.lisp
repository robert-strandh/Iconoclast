(cl:in-package #:iconoclast)

(define-ast-class declare-ast (ast)
  (;; This slot contains a (possibly empty) list of DECLARATION-
   ;; SPECIFIER-ASTs.
   (* declaration-specifier-asts)))
