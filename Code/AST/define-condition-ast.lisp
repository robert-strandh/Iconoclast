(cl:in-package #:iconoclast)

(define-ast-class define-condition-ast
    (documentation-ast-mixin
     slot-specifier-asts-mixin
     name-ast-mixin
     default-initarg-asts-mixin
     ast)
  ((* parent-type-asts)
   (? report-ast)))

(define-ast-class condition-report-ast (ast)
  ((1 argument-ast)))
