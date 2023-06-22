(cl:in-package #:iconoclast)

(define-ast-class defvar-or-defparameter-ast
    (documentation-ast-mixin variable-name-ast-mixin form-ast-mixin ast)
  ())

(define-ast-class defvar-ast (defvar-or-defparameter-ast)
  ())

(define-ast-class defparameter-ast (defvar-or-defparameter-ast)
  ())
