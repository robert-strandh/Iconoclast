(cl:in-package #:iconoclast)

(defgeneric tag-ast (ast))

(defclass catch-ast (ast)
  ((%tag-ast
      :initarg :tag-ast
      :reader tag-ast)
   (%form-asts
      :initarg :form-asts
      :reader form-asts)))

(defgeneric result-form-ast (ast))

(defclass throw-ast (ast)
  ((%tag-ast
      :initarg :tag-ast
      :reader tag-ast)
   (%result-form-ast
      :initarg :result-form-ast
      :reader result-form-ast)))
