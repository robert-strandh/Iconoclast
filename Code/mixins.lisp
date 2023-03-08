(cl:in-package #:iconoclast)

(defgeneric form-ast (ast))

(defclass form-ast-mixin ()
  ((%form-ast
      :initarg :form-ast
      :reader form-ast)))

(defgeneric form-asts (ast))

(defclass form-asts-mixin ()
  ((%form-asts
      :initform '()
      :initarg :form-asts
      :reader form-asts)))

(defgeneric declaration-asts (ast))

(defclass declaration-asts-mixin ()
  ((%declaration-asts
      :initform nil
      :initarg :declaration-asts
      :reader declaration-asts)))

(defgeneric documentation-ast (ast))

(defclass documentation-ast-mixin ()
  ((%documentation-ast
      :initarg :documentation-ast
      :reader documentation-ast)))

(defgeneric name-ast (ast))

(defclass name-ast-mixin ()
  ((%name-ast
      :initarg :name-ast
      :reader name-ast)))

(defgeneric tag-ast (ast))

(defclass tag-ast-mixin ()
  ((%tag-ast
      :initarg :tag-ast
      :reader tag-ast)))

(defgeneric test-ast (ast))

(defclass test-ast-mixin ()
  ((%test-ast
      :initarg :test-ast
      :reader test-ast)))
