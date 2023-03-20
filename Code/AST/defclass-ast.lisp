(cl:in-package #:iconoclast)

(defclass slot-specifier-ast (name-ast-mixin ast)
  ())

(defgeneric slot-specifier-asts (ast))

(defclass defclass-ast (name-ast-mixin ast)
  ((%slot-specifier-asts
    :initform '()
    :initarg :slot-specifier-asts
    :reader slot-specifier-asts)))

(defclass initarg-name-ast (name-mixin ast)
  ())
