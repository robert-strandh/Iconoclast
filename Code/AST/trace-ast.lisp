(cl:in-package #:iconoclast)

(defgeneric function-name-asts (ast))

(defclass function-name-asts-mixin ()
  ((%function-name-asts
    :initform '()
    :initarg :function-name-asts
    :reader function-name-asts)))

(defclass trace-ast (function-name-asts-mixin ast)
  ())

(defclass untrace-ast (function-name-asts-mixin ast)
  ())
