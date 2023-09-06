(cl:in-package #:iconoclast)

(define-ast-class variable-binding-ast
    (optional-form-ast-mixin variable-name-ast-mixin ast)
  ())

(define-ast-class let-or-let*-ast
    (binding-asts-mixin
     declaration-asts-mixin
     form-asts-mixin
     special-form-ast)
  ())

(define-ast-class let-ast (let-or-let*-ast)
  ())

(define-ast-class let*-ast (let-or-let*-ast)
  ())
