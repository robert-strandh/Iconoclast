(cl:in-package #:iconoclast)

(defclass defclass-ast (slot-specifier-asts-mixin name-ast-mixin ast)
  ())

(defclass initarg-name-ast (name-mixin ast)
  ())
