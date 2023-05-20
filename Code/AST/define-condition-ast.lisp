(cl:in-package #:iconoclast)

(defclass define-condition-ast
    (documentation-ast-mixin
     slot-specifier-asts-mixin
     name-ast-mixin
     default-initarg-asts-mixin
     ast)
  ())
