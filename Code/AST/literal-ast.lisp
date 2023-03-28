(cl:in-package #:iconoclast)

(defclass literal-ast (ast)
  ((%literal
    :initarg :literal
    :reader literal)))

(defmethod children append ((ast literal-ast))
  (list (cons "literal" (literal ast))))
