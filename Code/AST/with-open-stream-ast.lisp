(cl:in-package #:iconoclast)

(defgeneric stream-ast (ast))

(defclass with-open-stream-ast
    (variable-name-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ((%stream-ast
    :initarg :stream-ast
    :reader stream-ast)))

(defmethod children append ((ast with-open-stream-ast))
  (list (cons "stream-ast" (stream-ast ast))))
