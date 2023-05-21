(cl:in-package #:iconoclast)

(defgeneric form-ast (ast))

(defclass form-ast-mixin ()
  ((%form-ast
      :initform nil
      :initarg :form-ast
      :reader form-ast)))

(defmethod children append ((ast form-ast-mixin))
  (list (cons "form-ast" (form-ast ast))))

(defgeneric place-ast (ast))

(defclass place-ast-mixin ()
  ((%place-ast
      :initform nil
      :initarg :place-ast
      :reader place-ast)))

(defmethod children append ((ast place-ast-mixin))
  (list (cons "place-ast" (place-ast ast))))

(defgeneric form-asts (ast))

(defclass form-asts-mixin ()
  ((%form-asts
      :initform '()
      :initarg :form-asts
      :reader form-asts)))

(defmethod children append ((ast form-asts-mixin))
  (list (cons "form-asts" (form-asts ast))))

(defgeneric declaration-asts (ast))

(defclass declaration-asts-mixin ()
  ((%declaration-asts
      :initform nil
      :initarg :declaration-asts
      :reader declaration-asts)))

(defmethod children append ((ast declaration-asts-mixin))
  (list (cons "declaration-asts" (declaration-asts ast))))

(defgeneric documentation-ast (ast))

(defclass documentation-ast-mixin ()
  ((%documentation-ast
      :initform nil
      :initarg :documentation-ast
      :reader documentation-ast)))

(defmethod children append ((ast documentation-ast-mixin))
  (list (cons "documentation-ast" (documentation-ast ast))))

(defgeneric name-ast (ast))

(defclass name-ast-mixin ()
  ((%name-ast
      :initarg :name-ast
      :reader name-ast)))

(defmethod children append ((ast name-ast-mixin))
  (list (cons "name-ast" (name-ast ast))))

(defgeneric tag-ast (ast))

(defclass tag-ast-mixin ()
  ((%tag-ast
      :initarg :tag-ast
      :reader tag-ast)))

(defmethod children append ((ast tag-ast-mixin))
  (list (cons "tag-ast" (tag-ast ast))))

(defgeneric test-ast (ast))

(defclass test-ast-mixin ()
  ((%test-ast
      :initarg :test-ast
      :reader test-ast)))

(defmethod children append ((ast test-ast-mixin))
  (list (cons "test-ast" (test-ast ast))))

(defgeneric variable-name-ast (parameter-ast))

(defclass variable-name-ast-mixin ()
  ((%variable-name-ast
    :initarg :variable-name-ast
    :reader variable-name-ast)))

(defmethod children append ((ast variable-name-ast-mixin))
  (list (cons "variable-name-ast" (variable-name-ast ast))))

(defgeneric name (ast))

(defclass name-mixin ()
  ((%name :initarg :name :reader name)))

(defmethod children append ((ast name-mixin))
  (list (cons "name" (name ast))))

;;; This class can be mixed into classes that need to store several
;;; names.

(defgeneric name-asts (ast))

(defclass name-asts-mixin ()
  ((%name-asts
    :initform '()
    :initarg :name-asts
    :reader name-asts)))

(defmethod children append ((ast name-asts-mixin))
  (list (cons "name-asts" (name-asts ast))))

(defgeneric clause-asts (ast))

(defclass clause-asts-mixin ()
  ((%clause-asts
    :initform '()
    :initarg :clause-asts
    :reader clause-asts)))

(defmethod children append ((ast clause-asts-mixin))
  (list (cons "clause-asts" (clause-asts ast))))

(defgeneric type-specifier-ast (ast))

(defclass type-specifier-ast-mixin ()
  ((%type-specifier-ast
    :initarg :type-specifier-ast
    :reader type-specifier-ast)))

(defmethod children append ((ast type-specifier-ast-mixin))
  (list (cons "type-specifier-ast"
              (type-specifier-ast ast))))

(defclass value-mixin ()
  ((%value
    :initarg :value
    :reader value)))

(defmethod children append ((ast value-mixin))
  (list (cons "value" (value ast))))

(defgeneric slot-specifier-asts (ast))

(defclass slot-specifier-asts-mixin ()
  ((%slot-specifier-asts
    :initform '()
    :initarg :slot-specifier-asts
    :reader slot-specifier-asts)))

(defmethod children append ((ast slot-specifier-asts-mixin))
  (list (cons "slot-specifier-asts" (slot-specifier-asts ast))))

(defgeneric default-initarg-asts (ast))

(defclass default-initarg-asts-mixin ()
  ((%default-initarg-asts
    :initform '()
    :initarg :default-initarg-asts
    :reader default-initarg-asts)))

(defmethod children append ((ast default-initarg-asts-mixin))
  (list (cons "default-initarg-asst" (default-initarg-asts ast))))

(defclass initform-ast-mixin ()
  ((%initform-ast
    :initarg :initform-ast
    :reader initform-ast)))

(defmethod children append ((ast initform-ast-mixin))
  (list (cons "initform-ast" (initform-ast ast))))

(defgeneric superclass-asts (ast))

(defclass superclass-asts-mixin ()
  ((%superclass-asts
    :initform '()
    :initarg :superclass-asts
    :reader superclass-asts)))

(defmethod children append ((ast superclass-asts-mixin))
  (list (cons "superclass-asts" (superclass-asts ast))))
