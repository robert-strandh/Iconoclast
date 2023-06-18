(cl:in-package #:iconoclast)

(defclass setf-or-psetf-ast (place-asts-mixin form-asts-mixin ast)
  ())

(defclass setf-ast (setf-or-psetf-ast)
  ())

(defclass psetf-ast (setf-or-psetf-ast)
  ())
