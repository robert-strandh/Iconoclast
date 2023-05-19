(cl:in-package #:iconoclast)

(defgeneric initarg-asts (slot-specifier-ast))

(defgeneric initform-ast (slot-specifier-ast))

(defgeneric reader-asts (slot-specifier-ast))

(defgeneric writer-asts (slot-specifier-ast))

(defclass slot-specifier-ast (name-ast-mixin ast)
  ((%initarg-asts
    :initform '()
    :initarg :initarg-asts
    :reader initarg-asts)
   (%initform-ast
    :initarg :initform-ast
    :reader initform-ast)
   (%reader-asts
    :initform '()
    :initarg :reader-asts
    :reader reader-asts)
   (%writer-asts
    :initform '()
    :initarg :writer-asts
    :reader writer-asts)))

(defmethod children append ((ast slot-specifier-ast))
  (list (cons "initarg-asts" (initarg-asts ast))
        (cons "initform-ast" (initform-ast ast))
        (cons "reader-asts" (reader-asts ast))
        (cons "writer-asts" (writer-asts ast))))

(defclass initarg-name-ast (name-mixin ast)
  ())
