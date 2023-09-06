(cl:in-package #:iconoclast)

(define-ast-class defgeneric-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     documentation-ast-mixin
     macro-form-ast)
  ((* argument-precedence-order-asts)
   (? generic-function-class-ast)
   (? method-class-ast)
   (? method-combination-name-and-arguments-ast)
   (* method-description-asts)))

(define-ast-class method-combination-name-and-arguments-ast
    (name-ast-mixin
     ast)
  ((* method-combination-arguments)))

(define-ast-class method-description-ast
    (lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     form-asts-mixin
     ast)
  ((* method-qualifier-asts)))
