(cl:in-package #:iconoclast)

(defgeneric variable-name-ast (ast))

(defclass variable-binding-ast (form-ast-mixin ast)
  ((%variable-name-ast
      :initarg :variable-name-ast
      :reader variable-name-ast))
  (:default-initargs :form-ast nil))

(defmethod children append ((ast variable-binding-ast))
  (list (cons "variable-name-ast" (variable-name-ast ast))))

(defclass let-or-let*-ast
    (binding-asts-mixin declaration-asts-mixin form-asts-mixin ast)
  ())

(defclass let-ast (let-or-let*-ast)
  ())

(defclass let*-ast (let-or-let*-ast)
  ())
