(cl:in-package #:iconoclast)

(define-ast-class with-package-iterator-ast
    (declaration-asts-mixin implicit-progn-ast-mixin macro-form-ast)
  ((1 name-ast)
   (1 package-list-ast)
   (1 symbol-types-ast)))
