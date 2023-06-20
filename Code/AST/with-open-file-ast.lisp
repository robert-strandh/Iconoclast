(cl:in-package #:iconoclast)

(defgeneric filespec-ast (ast))

(defgeneric option-asts (ast))

(defclass with-open-file-ast
    (variable-name-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ((%filespec-ast
    :initarg :filespec-ast
    :reader filespec-ast)
   (%option-asts
    :initform '()
    :initarg :option-asts
    :reader option-asts)))

(defmethod children append ((ast with-open-file-ast))
  (list (cons "filespec-ast" (filespec-ast ast))
        (cons "option-asts" (option-asts ast))))
