(cl:in-package #:iconoclast)

(define-ast-class segment-asts-mixin ()
  ((* segment-asts)))

(define-ast-class tagbody-segment-ast (tag-ast-mixin ast)
  ((* statement-asts)))

(define-ast-class go-ast (tag-ast-mixin ast)
  ())
