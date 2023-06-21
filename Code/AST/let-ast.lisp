(cl:in-package #:iconoclast)

(defgeneric variable-name-ast (ast))

(define-ast-class variable-binding-ast (form-ast-mixin ast)
  ((1 variable-name-ast)))

(define-ast-class let-or-let*-ast
    (binding-asts-mixin declaration-asts-mixin form-asts-mixin ast)
  ())

(define-ast-class let-ast (let-or-let*-ast)
  ())

(define-ast-class let*-ast (let-or-let*-ast)
  ())
