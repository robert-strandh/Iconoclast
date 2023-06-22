(cl:in-package #:iconoclast)

(define-ast-class handler-clause-ast
    (variable-name-ast-mixin
     type-specifier-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ())

(define-ast-class no-error-clause-ast
    (lambda-list-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ())

(define-ast-class handler-case-ast (clause-asts-mixin form-ast-mixin ast)
  ((? no-error-clause-ast)))
