(cl:in-package #:iconoclast)

(defclass name-ast (name-mixin ast)
  ())

(defclass variable-name-ast (name-ast)
  ())

(defclass function-name-ast (name-ast)
  ())
