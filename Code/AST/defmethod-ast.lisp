(cl:in-package #:iconoclast)

(defclass specialized-parameter-ast (name-ast-mixin ast)
  ((%specializer-ast
    :initform nil
    :initarg :specializer-ast
    :reader specializer-ast)))

(defgeneric required-asts (lambda-list-ast))

(defclass specialized-lambda-list-ast (lambda-list-ast)
  (;; This slot should probably be moved to a superclass or to a mixin
   ;; class.
   (%required-asts
    :initform '()
    :initarg :required-asts
    :reader required-asts)))

(defclass defmethod-ast (name-ast-mixin function-definition-ast)
  ())
