(cl:in-package #:iconoclast)

(define-ast-class with-accessors-slot-entry (ast)
  ((1 variable-name-ast)
   (1 accessor-name-ast)))

(define-ast-class with-accessors-ast
    (form-asts-mixin declaration-asts-mixin ast)
  ((* slot-entry-asts)
   (1 instance-form-ast)))
