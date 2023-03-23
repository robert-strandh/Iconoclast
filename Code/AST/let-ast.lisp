(cl:in-package #:iconoclast)

(defgeneric variable-name-ast (ast))

(defclass variable-binding-ast (form-ast-mixin ast)
  ((%variable-name-ast
      :initarg :variable-name-ast
      :reader variable-name-ast))
  (:default-initargs :form-ast nil))

(defmethod children append ((ast variable-binding-ast))
  (list (cons "variable-name-ast" (variable-ast ast))))

(defgeneric variable-binding-asts (ast))

(defclass let-or-let*-ast
    (declaration-asts-mixin form-asts-mixin ast)
  ((%variable-binding-asts
      :initform '()
      :initarg :variable-binding-asts
      :accessor variable-binding-asts)))

(defmethod children append ((ast let-or-let*-ast))
  (list (cons "variable-binding-asts"
              (variable-binding-asts ast))))

(defclass let-ast (let-or-let*-ast)
  ())

(defclass let*-ast (let-or-let*-ast)
  ())
