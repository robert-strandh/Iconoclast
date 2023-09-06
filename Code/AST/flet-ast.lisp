(cl:in-package #:iconoclast)

(define-ast-class local-function-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     form-asts-mixin
     ast)
  ())

(define-ast-class flet-or-labels-or-macrolet-ast
    (binding-asts-mixin
     declaration-asts-mixin
     form-asts-mixin
     special-form-ast)
  ())

(define-ast-class flet-ast (flet-or-labels-or-macrolet-ast)
  ())

(define-ast-class labels-ast (flet-or-labels-or-macrolet-ast)
  ())

(define-ast-class macrolet-ast (flet-or-labels-or-macrolet-ast)
  ())
