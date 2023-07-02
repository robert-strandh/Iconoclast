(cl:in-package #:iconoclast)

(define-ast-class do-symbols-do-external-symbols-ast
    (result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin
     ast)
  ((1 variable-name-ast)
   (? package-ast)))

(define-ast-class do-symbols-ast (do-symbols-do-external-symbols-ast)
  ())

(define-ast-class do-external-symbols-ast (do-symbols-do-external-symbols-ast)
  ())
