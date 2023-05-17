(cl:in-package #:iconoclast)

(defclass defgeneric-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     ast)
  ())

;; (defmethod children append ((ast defgeneric-ast))
;;   ...)
