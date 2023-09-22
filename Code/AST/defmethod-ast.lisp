(cl:in-package #:iconoclast)

(define-ast-class method-qualifier-ast (name-mixin ast)
  ())

(define-ast-class specialized-parameter-ast (name-ast-mixin ast)
  ((? specializer-ast)))

(define-ast-class defmethod-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     implicit-progn-ast-mixin
     macro-form-ast)
  ((* method-qualifier-asts)))
