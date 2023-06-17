(cl:in-package #:iconoclast)

(defgeneric control-string-ast (ast))

(defclass formatter-ast (ast)
  ((%control-string-ast
    :initarg :control-string-ast
    :reader control-string-ast)))

(defmethod children append ((ast formatter-ast))
  (list (cons "control-string-ast" (control-string-ast ast))))
