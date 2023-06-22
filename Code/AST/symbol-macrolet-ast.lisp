(cl:in-package #:iconoclast)

(define-ast-class symbol-expansion-ast (ast)
  ((1 symbol-ast)
   (1 expansion-ast)))

(define-ast-class symbol-macrolet-ast
    (declaration-asts-mixin form-asts-mixin ast)
  ((* symbol-expansion-asts)))
