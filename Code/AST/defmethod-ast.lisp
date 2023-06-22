(cl:in-package #:iconoclast)

(define-ast-class specialized-parameter-ast (name-ast-mixin ast)
  ((? specializer-ast)))

(define-ast-class defmethod-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     form-asts-mixin
     ast)
  ((* method-qualifier-asts)))
