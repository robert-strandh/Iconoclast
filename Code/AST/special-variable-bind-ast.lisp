(cl:in-package #:iconoclast)

;;; This AST class is used to make bindings of special variables
;;; obvious, as opposed to those bindings being part of a LET or a
;;; LET*.

(define-ast-class special-variable-binding-ast
    (required-form-ast-mixin variable-name-ast-mixin ast)
  ())

(define-ast-class special-variable-bind-ast
    (declaration-asts-mixin
     implicit-progn-ast-mixin
     ast)
  ((1 binding-ast)))
