(cl:in-package #:iconoclast)

(define-ast-class setq-or-psetq-ast (ast)
  ((* value-asts)
   (* variable-name-asts)))

(define-ast-class setq-ast (setq-or-psetq-ast special-form-ast)
  ())

(define-ast-class psetq-ast (setq-or-psetq-ast macro-form-ast)
  ())
