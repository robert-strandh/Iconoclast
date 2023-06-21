(cl:in-package #:iconoclast)

(define-ast-class unparsed-ast (ast)
  ())

(define-ast-class unparsed-form-ast (unparsed-ast)
  ((1 form)))

