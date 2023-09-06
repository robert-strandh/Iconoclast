(cl:in-package #:iconoclast)

(define-ast-class defvar-or-defparameter-ast
    (documentation-ast-mixin
     variable-name-ast-mixin
     macro-form-ast)
  ())

(define-ast-class defvar-ast
    (optional-form-ast-mixin defvar-or-defparameter-ast)
  ())

(define-ast-class defparameter-ast
    (required-form-ast-mixin defvar-or-defparameter-ast)
  ())
