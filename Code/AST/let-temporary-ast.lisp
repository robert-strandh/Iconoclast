(cl:in-package #:iconoclast)

;;; This AST class is similar to LET-AST, with the difference that
;;; there is a single binding, and it is known that the variable
;;; introduced by the binding is known to be lexical, and it is not
;;; shared between functions, so it is a temporary variable.

(define-ast-class let-temporary-ast
    (declaration-asts-mixin
     implicit-progn-ast-mixin
     special-form-ast)
  ((1 binding-ast)))
