(cl:in-package #:iconoclast)

(define-ast-class tag-ast (name-ast)
  ())

(defgeneric tag-reference-asts (tag-definition-ast))

(define-ast-class tag-definition-ast (tag-ast)
  ((* tag-reference-asts)))

(define-ast-class tag-reference-ast (tag-ast)
  ((? tag-definition-ast)))
