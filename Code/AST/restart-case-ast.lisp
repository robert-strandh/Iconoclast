(cl:in-package #:iconoclast)

(define-ast-class restart-clause-ast
    (form-asts-mixin
     declaration-asts-mixin
     lambda-list-ast-mixin
     name-ast-mixin
     ast)
  ((? report-ast)
   (? interactive-ast)
   (? test-ast)))

(define-ast-class restart-case-ast
    (clause-asts-mixin
     required-form-ast-mixin
     ast)
  ())
