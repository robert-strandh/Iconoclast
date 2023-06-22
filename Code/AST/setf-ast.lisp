(cl:in-package #:iconoclast)

(define-ast-class setf-or-psetf-ast (place-asts-mixin form-asts-mixin ast)
  ())

(define-ast-class setf-ast (setf-or-psetf-ast)
  ())

(define-ast-class psetf-ast (setf-or-psetf-ast)
  ())
