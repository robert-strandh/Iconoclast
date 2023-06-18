(cl:in-package #:iconoclast)

(defgeneric stream-ast (ast))

(defclass print-unreadable-object-ast
    (object-ast-mixin form-asts-mixin ast)
  ((%stream-ast
    :initarg :stream-ast
    :reader stream-ast)
   (%type-ast
    :initform nil
    :initarg :type-ast
    :reader type-ast)
   (%identity-ast
    :initform nil
    :initarg :identity-ast
    :reader identity-ast)))

(defmethod children append ((ast print-unreadable-object-ast))
  (list (cons "stream-ast" (stream-ast ast))
        (cons "type-ast" (type-ast ast))
        (cons "identity-ast" (identity-ast ast))))
