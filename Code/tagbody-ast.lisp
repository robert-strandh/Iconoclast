(cl:in-package #:iconoclast)

(defclass tagbody-ast (ast)
  ((%contents-asts
      :initform '()
      :initarg :contents-asts
      :reader contents-asts)))

(defgeneric tag-asts (ast))

(defclass tagbody-segment-ast (form-asts-mixin ast)
  ((%tag-asts
      :initform '()
      :initarg :tag-asts
      :reader tag-asts)))


(defclass tagbody-tag-ast (tag-ast-mixin ast)
  ((%tagbody-ast
      :initarg :tagbody-ast
      :reader tagbody-ast)))

(defclass go-ast (tag-ast-mixin ast)
  ())
