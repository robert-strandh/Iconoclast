(cl:in-package #:iconoclast)

(defclass when-ast (test-ast-mixin form-asts-mixin ast)
  ())

(defclass unless-ast (test-ast-mixin form-asts-mixin ast)
  ())
