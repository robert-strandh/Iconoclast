(cl:in-package #:iconoclast)

;;; FIXME: make an initform-ast-mixin class

(defclass default-initarg-ast (name-ast ast)
  ((%initform-ast
    :initarg :initform-ast
    :reader initform-ast)))
