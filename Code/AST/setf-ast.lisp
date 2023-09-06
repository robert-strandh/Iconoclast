(cl:in-package #:iconoclast)

(define-ast-class setf-or-psetf-ast (place-asts-mixin macro-form-ast)
  ((* value-asts)))

(define-ast-class setf-ast (setf-or-psetf-ast)
  ())

(define-ast-class psetf-ast (setf-or-psetf-ast)
  ())
