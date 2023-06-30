(cl:in-package #:iconoclast)

(define-ast-class check-type-ast ()
  ((1 place-ast)
   (1 typespec-ast)
   (? description-ast)))
