(cl:in-package #:iconoclast)

(define-ast-class setq-or-psetq-ast (ast)
  ((* value-form-asts)
   (* variable-name-asts)))

(define-ast-class setq-ast (setq-or-psetq-ast)
  ())

(define-ast-class psetq-ast (setq-or-psetq-ast)
  ())
