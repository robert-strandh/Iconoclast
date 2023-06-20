(cl:in-package #:iconoclast)

(defclass handler-clause-ast
    (variable-name-ast-mixin
     type-specifier-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ())

(defclass no-error-clause-ast
    (lambda-list-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ())

(defgeneric no-error-clause-ast (ast))

(defclass handler-case-ast (clause-asts-mixin form-ast-mixin ast)
  ((%no-error-clause-ast
    :initform nil
    :initarg :no-error-clause-ast
    :reader no-error-clause-ast)))

(defmethod children append ((ast handler-case-ast))
  (list (cons "no-error-clause-ast" (no-error-clause-ast ast))))
