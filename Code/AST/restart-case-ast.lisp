(cl:in-package #:iconoclast)

(defclass restart-clause-ast
    (lambda-list-ast-mixin name-ast-mixin ast)
  ())

(defclass restart-case-ast (form-ast-mixin ast)
  ((%clause-asts
    :initform '()
    :initarg :clause-asts
    :reader clause-asts)))
