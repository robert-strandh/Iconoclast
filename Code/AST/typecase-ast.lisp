(cl:in-package #:iconoclast)

(define-ast-class typecase-clause-ast (implicit-progn-ast-mixin ast)
  ())

(define-ast-class typecase-normal-clause-ast
    (type-specifier-ast-mixin typecase-clause-ast)
  ())

(define-ast-class typecase-otherwise-clause-ast (typecase-clause-ast)
  ())

(define-ast-class typecase-base-ast (clause-asts-mixin macro-form-ast)
  ())

(define-ast-class typecase-or-etypecase-ast (typecase-base-ast)
  ((1 keyform-ast)))

(define-ast-class typecase-ast (typecase-or-etypecase-ast)
  ())

(define-ast-class etypecase-ast (typecase-or-etypecase-ast)
  ())

(define-ast-class ctypecase-ast (typecase-base-ast)
  ((1 keyplace-ast)))
