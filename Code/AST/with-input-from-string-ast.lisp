(cl:in-package #:iconoclast)

(defgeneric string-ast (ast))

(defgeneric index-ast (ast))

(defgeneric start-ast (ast))

(defgeneric end-ast (ast))

(defclass with-input-from-string-ast
    (variable-name-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ((%string-ast
    :initarg :string-ast
    :reader string-ast)
   (%index-ast
    :initform nil
    :initarg :index-ast
    :reader index-ast)
   (%start-ast
    :initform nil
    :initarg :start-ast
    :reader start-ast)
   (%end-ast
    :initform nil
    :initarg :end-ast
    :reader end-ast)))

(defmethod children append ((ast with-input-from-string-ast))
  (list (cons "string-ats" (string-ast ast))
        (cons "index-ats" (index-ast ast))
        (cons "start-ats" (start-ast ast))
        (cons "end-ats" (end-ast ast))))
