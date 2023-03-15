(cl:in-package #:iconoclast)

(defgeneric variable-ast (ast))

(defclass setq-ast (form-ast-mixin ast)
  ((%variable-ast
      :initarg :variable-ast
      :reader variable-ast)))
