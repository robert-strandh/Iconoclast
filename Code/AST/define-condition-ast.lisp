(cl:in-package #:iconoclast)

(define-ast-class define-condition-ast
    (documentation-ast-mixin
     superclass-asts-mixin
     slot-specifier-asts-mixin
     name-ast-mixin
     default-initarg-asts-mixin
     ast)
  ((? report-ast)))

(define-ast-class condition-report-ast (ast)
  ((1 argument-ast)))
