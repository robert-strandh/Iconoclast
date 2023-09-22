(cl:in-package #:iconoclast)

(define-ast-class with-accessors-slot-entry-ast (ast)
  ((1 variable-name-ast)
   (1 accessor-name-ast)))

(define-ast-class with-accessors-ast
    (implicit-progn-ast-mixin declaration-asts-mixin macro-form-ast)
  ((* slot-entry-asts)
   (1 instance-form-ast)))
