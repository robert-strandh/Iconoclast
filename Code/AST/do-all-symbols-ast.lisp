(cl:in-package #:iconoclast)

(defclass do-all-symbols-ast
    (variable-name-ast-mixin
     result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin
     ast)
  ())
