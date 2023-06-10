(cl:in-package #:iconoclast)

(defclass defconstant-ast
    (name-ast-mixin form-ast-mixin documentation-ast-mixin ast)
  ())
