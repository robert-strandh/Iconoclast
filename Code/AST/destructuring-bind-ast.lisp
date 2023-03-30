(cl:in-package #:iconoclast)

(defclass destructuring-bind-ast
    (lambda-list-ast-mixin
     form-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ())
