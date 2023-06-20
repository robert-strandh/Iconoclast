(cl:in-package #:iconoclast)

(defgeneric string-ast (ast))

(defgeneric element-type-ast (ast))

(defclass with-output-to-string-ast
    (variable-name-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ((%string-ast
    :initarg :string-ast
    :reader string-ast)
   (%element-type-ast
    :initform nil
    :initarg :element-type-ast
    :reader element-type-ast)))

(defmethod children append ((ast with-output-to-string-ast))
  (list (cons "string-ats" (string-ast ast))
        (cons "element-type-ats" (element-type-ast ast))))
