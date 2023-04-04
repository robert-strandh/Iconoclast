(cl:in-package #:iconoclast)

(defclass catch-ast (form-asts-mixin tag-ast-mixin ast)
  ())

(defgeneric result-form-ast (ast))

(defclass throw-ast (form-ast-mixin tag-ast-mixin ast)
  ())
