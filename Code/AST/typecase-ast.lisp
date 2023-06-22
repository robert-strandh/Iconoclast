(cl:in-package #:iconoclast)

(define-ast-class typecase-clause-ast (form-asts-mixin ast)
  ())

(define-ast-class typecase-normal-clause-ast
    (type-specifier-ast-mixin typecase-clause-ast)
  ())

(define-ast-class typecase-otherwise-clause-ast (typecase-clause-ast)
  ())

(define-ast-class typecase-base-ast (clause-asts-mixin ast)
  ())

(define-ast-class typecase-or-etypecase-ast (form-ast-mixin typecase-base-ast)
  ())

(define-ast-class typecase-ast (typecase-or-etypecase-ast)
  ())

(define-ast-class etypecase-ast (typecase-or-etypecase-ast)
  ())

(define-ast-class ctypecase-ast (place-ast-mixin typecase-base-ast)
  ())
