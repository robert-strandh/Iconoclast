(cl:in-package #:iconoclast)

(defgeneric variable-ast (ast))

(defclass variable-binding-ast (form-ast-mixin ast)
  ((%variable-ast
      :initarg :variable-ast
      :reader variable-ast)))

(defgeneric variable-binding-asts (ast))

(defclass let-or-let*-ast
    (declaration-asts-mixin form-asts-mixin ast)
  ((%variable-binding-asts
      :initform '()
      :initarg :variable-binding-asts
      :accessor variable-binding-asts)))

(defclass let-ast (let-or-let*-ast)
  ())

(defclass let*-ast (let-or-let*-ast)
  ())
