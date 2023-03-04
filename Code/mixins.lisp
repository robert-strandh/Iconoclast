(cl:in-package #:iconoclast)

(defgeneric form-asts (ast))

(defclass form-asts-mixin ()
  ((%form-asts
      :initarg :form-asts
      :reader form-asts)))

(defgeneric declaration-asts (ast))

(defclass declaration-asts-mixin ()
  ((%declaration-asts
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
