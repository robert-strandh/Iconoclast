(cl:in-package #:iconoclast)

(define-ast-class symbol-expansion-ast (ast)
  ((1 symbol-ast)
   (1 expansion-ast)))

(define-ast-class symbol-macrolet-ast
    (declaration-asts-mixin implicit-progn-ast-mixin special-form-ast)
  ((* symbol-expansion-asts)))
