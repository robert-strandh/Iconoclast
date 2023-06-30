(cl:in-package #:iconoclast)

(define-ast-class define-compiler-macro-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     form-asts-mixin
     ast)
  ())
