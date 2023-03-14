(cl:in-package #:iconoclast)

(defclass catch-ast (form-asts-mixin tag-ast-mixin ast)
  ())

(defgeneric result-form-ast (ast))

(defclass throw-ast (tag-ast-mixin ast)
  ((%result-form-ast
      :initarg :result-form-ast
      :reader result-form-ast)))

(defmethod children append ((ast throw-ast))
  (list (cons "result-form-ast" (result-form-ast ast))))
