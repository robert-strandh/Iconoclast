(cl:in-package #:iconoclast)

(defgeneric list-form-ast (ast))

(defclass dolist-ast
    (variable-name-ast-mixin
     result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin)
  ((%list-form-ast
    :initarg :list-form-ast
    :reader list-form-ast)))

(defmethod children append ((ast dolist-ast))
  (list (cons "list-form-ast" (list-form-ast ast))))
