(cl:in-package #:iconoclast)

(define-ast-class with-package-iterator-ast
    (declaration-asts-mixin form-asts-mixin macro-form-ast)
  ((1 name-ast)
   (1 package-list-ast)
   (1 symbol-types-ast)))
