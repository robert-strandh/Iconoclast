(cl:in-package #:iconoclast)

(defclass slot-specifier-ast (name-ast-mixin ast)
  ())

(defclass defclass-ast (slot-specifier-asts-mixin name-ast-mixin ast)
  ())

(defclass initarg-name-ast (name-mixin ast)
  ())
