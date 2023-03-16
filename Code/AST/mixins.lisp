(cl:in-package #:iconoclast)

(defgeneric form-ast (ast))

(defclass form-ast-mixin ()
  ((%form-ast
      :initarg :form-ast
      :reader form-ast)))

(defmethod children append ((ast form-ast-mixin))
  (list (cons "form-ast" (form-ast ast))))

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

(defgeneric variable-ast (parameter-ast))

(defclass variable-ast-mixin ()
  ((%variable-ast
    :initarg :variable-ast
    :reader variable-ast)))

(defmethod children append ((ast variable-ast-mixin))
  (list (cons "variable-ast" (variable-ast ast))))

(defgeneric name (ast))

(defclass name-mixin ()
  ((%name :initarg :name :reader name)))

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
