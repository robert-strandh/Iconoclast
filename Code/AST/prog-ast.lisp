(cl:in-package #:iconoclast)

(define-ast-class prog-or-prog*-ast
    (binding-asts-mixin
     declaration-asts-mixin
     segment-asts-mixin
     macro-form-ast)
  ())

(define-ast-class prog-ast (prog-or-prog*-ast)
  ())

(define-ast-class prog*-ast (prog-or-prog*-ast)
  ())
