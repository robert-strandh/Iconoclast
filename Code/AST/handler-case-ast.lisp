(cl:in-package #:iconoclast)

(define-ast-class handler-clause-ast
    (type-specifier-ast-mixin
     declaration-asts-mixin
     implicit-progn-ast-mixin
     ast)
  ((? variable-name-ast)))

(define-ast-class no-error-clause-ast
    (lambda-list-ast-mixin
     declaration-asts-mixin
     implicit-progn-ast-mixin
     ast)
  ())

(define-ast-class handler-case-ast
    (clause-asts-mixin
     required-form-ast-mixin
     macro-form-ast)
  ((? no-error-clause-ast)))
