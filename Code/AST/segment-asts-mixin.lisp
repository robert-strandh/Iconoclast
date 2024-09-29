(cl:in-package #:iconoclast)

(define-ast-class segment-asts-mixin ()
  ((* segment-asts)))

(define-ast-class tagbody-segment-ast (ast)
  ((? tag-ast)
   (* statement-asts)
   (? tagbody-ast)))

(define-ast-class go-ast (tag-ast-mixin special-form-ast)
  ())
