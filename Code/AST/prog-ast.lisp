(cl:in-package #:iconoclast)

(defclass prog-or-prog*-ast
    (binding-asts-mixin
     declaration-asts-mixin
     segment-asts-mixin
     ast)
  ())

(defclass prog-ast (prog-or-prog*-ast)
  ())

(defclass prog*-ast (prog-or-prog*-ast)
  ())
