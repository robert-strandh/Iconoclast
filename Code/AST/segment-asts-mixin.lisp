(cl:in-package #:iconoclast)

(define-ast-class segment-asts-mixin ()
  ((* segment-asts)))

(define-ast-class tagbody-segment-ast (form-asts-mixin tag-ast-mixin ast)
  ())

(define-ast-class go-ast (tag-ast-mixin ast)
  ())
