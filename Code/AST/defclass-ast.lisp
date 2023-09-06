(cl:in-package #:iconoclast)

(define-ast-class defclass-ast
    (documentation-ast-mixin
     superclass-asts-mixin
     slot-specifier-asts-mixin
     name-ast-mixin
     default-initarg-asts-mixin
     macro-form-ast)
  ((? metaclass-ast)))
