(cl:in-package #:iconoclast)

(defclass tag-ast (name-ast)
  ())

(defgeneric tag-reference-asts (tag-definition-ast))

(defclass tag-definition-ast (tag-ast)
  ((%tag-reference-asts
    :initform '()
    :initarg :tag-reference-asts
    :reader tag-reference-asts)))

(defgeneric tag-definition-ast (tag-reference-ast))

(defclass tag-reference-ast (tag-ast)
  ((%tag-definition-ast
    :initarg :tag-definition-ast
    :reader tag-definition-ast)))
