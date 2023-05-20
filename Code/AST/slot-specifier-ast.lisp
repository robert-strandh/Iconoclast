(cl:in-package #:iconoclast)

(defgeneric initarg-asts (slot-specifier-ast))

(defgeneric initform-ast (slot-specifier-ast))

(defgeneric type-specifier-ast (slot-specifier-ast))

(defgeneric reader-asts (slot-specifier-ast))

(defgeneric writer-asts (slot-specifier-ast))

(defgeneric accessor-asts (slot-specifier-ast))

(defgeneric allocation (slot-specifier-ast))

(defclass slot-specifier-ast
    (initform-ast-mixin documentation-ast-mixin name-ast-mixin ast)
  ((%initarg-asts
    :initform '()
    :initarg :initarg-asts
    :reader initarg-asts)
   (%type-specifier-ast
    :initform nil
    :initarg :type-specifier-ast
    :reader type-specifier-ast)
   (%reader-asts
    :initform '()
    :initarg :reader-asts
    :reader reader-asts)
   (%writer-asts
    :initform '()
    :initarg :writer-asts
    :reader writer-asts)
   (%accessor-asts
    :initform '()
    :initarg :accessor-asts
    :reader accessor-asts)
   (%allocation
    :initform nil
    :initarg :allocation
    :reader allocation)))

(defmethod children append ((ast slot-specifier-ast))
  (list (cons "initarg-asts" (initarg-asts ast))
        (cons "type-specifier-ast" (type-specifier-ast ast))
        (cons "reader-asts" (reader-asts ast))
        (cons "writer-asts" (writer-asts ast))
        (cons "accessor-asts" (accessor-asts ast))))

(defclass initarg-name-ast (name-mixin ast)
  ())
