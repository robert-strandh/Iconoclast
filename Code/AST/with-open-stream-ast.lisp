(cl:in-package #:iconoclast)

(define-ast-class with-open-stream-ast
    (variable-name-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ((1 stream-ast)))
