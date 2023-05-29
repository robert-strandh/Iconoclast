(cl:in-package #:iconoclast)

(defclass handler-binding-ast
    (type-specifier-ast-mixin form-ast-mixin ast)
  ())

(defgeneric handler-binding-asts (handler-bind-ast))

(defclass handler-bind-ast (form-asts-mixin ast)
  ((%handler-binding-asts
    :initform '()
    :initarg :handler-binding-asts
    :reader handler-binding-asts)))

(defmethod children append ((ast handler-binding-ast))
  (list (cons "handler-binding-asts" (handler-binding-asts ast))))
