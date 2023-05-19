(cl:in-package #:iconoclast)

(defgeneric initarg-asts (slot-specifier-ast))

(defclass slot-specifier-ast (name-ast-mixin ast)
  ((%initarg-asts
    :initform '()
    :initarg :initarg-asts
    :reader initarg-asts)))

(defmethod children append ((ast slot-specifier-ast))
  (list (cons "initarg-asts" (initarg-asts ast))))

(defclass initarg-name-ast (name-mixin ast)
  ())
