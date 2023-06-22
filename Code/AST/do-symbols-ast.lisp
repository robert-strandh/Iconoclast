(cl:in-package #:iconoclast)

(define-ast-class do-symbols-do-external-symbols-ast
    (variable-name-ast-mixin
     result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin
     ast)
  ((? package-ast)))

(define-ast-class do-symbols-ast (do-symbols-do-external-symbols-ast)
  ())

(define-ast-class do-external-symbols-ast (do-symbols-do-external-symbols-ast)
  ())
