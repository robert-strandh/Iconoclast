(cl:in-package #:iconoclast)

(define-ast-class with-hash-table-iterator-ast
    (declaration-asts-mixin form-asts-mixin macro-form-ast)
  ((1 name-ast)
   (1 hash-table-ast)))
