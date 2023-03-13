(cl:in-package #:iconoclast)

(defgeneric object-ast (ast))

(defclass quote-ast (ast)
  ((%object-ast
      :initarg :object-ast
      :reader object-ast)))

(defmethod children append ((ast quote-ast))
  (list (cons "object-ast" (object-ast ast))))
