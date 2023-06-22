(cl:in-package #:iconoclast)

(define-ast-class setq-or-psetq-ast (form-asts-mixin ast)
  ((* variable-name-asts)))

(define-ast-class setq-ast (setq-or-psetq-ast)
  ())

(define-ast-class psetq-ast (setq-or-psetq-ast)
  ())
