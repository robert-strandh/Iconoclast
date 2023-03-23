(cl:in-package #:iconoclast)

;;; This is the root class of all ASTs that mention a variable. Here we
;;; consider a function name as being a variable.
(defclass variable-name-ast (name-mixin ast)
  ())
