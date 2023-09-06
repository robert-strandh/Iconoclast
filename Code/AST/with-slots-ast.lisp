(cl:in-package #:iconoclast)

(define-ast-class slot-entry-ast (ast)
  ((1 variable-name-ast)
   (1 slot-name-ast)))

(define-ast-class with-slots-ast
    (declaration-asts-mixin form-asts-mixin macro-form-ast)
  ((* slot-entry-asts)
   (1 instance-form-ast)))
