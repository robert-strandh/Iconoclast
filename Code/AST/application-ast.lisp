(cl:in-package #:iconoclast)

(defgeneric function-ast (ast))

(defgeneric argument-asts (ast))

(defclass application-ast (ast)
  ((%function-ast
    :initarg :function-ast
    :reader function-ast)
   (%argument-asts
    :initform '()
    :initarg :argument-asts
    :reader argument-asts)))

(defmethod children append ((ast application-ast))
  (list (cons "function-ast" (function-ast ast))
        (cons "argument-asts" (argument-asts ast))))
