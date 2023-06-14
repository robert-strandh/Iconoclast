(cl:in-package #:iconoclast)

(defclass function-call-ast (ast)
  ((%function-name-ast
    :initarg :function-name-ast
    :reader function-name-ast)
   (%argument-asts
    :initform '()
    :initarg :argument-asts
    :reader argument-asts)))

(defmethod children append ((ast function-call-ast))
  (list (cons "function-name-ast" (function-name-ast ast))
        (cons "argument-asts" (argument-asts ast))))
