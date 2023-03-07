(cl:in-package #:iconoclast)

(defclass tagbody-ast (ast)
  ((%contents-asts
      :initform '()
      :initarg :contents-asts
      :reader contents-asts)))

(defclass tagbody-tag-ast (tag-ast-mixin ast)
  ((%tagbody-ast
      :initarg :tagbody-ast
      :reader tagbody-ast)))

(defclass go-ast (tag-ast-mixin ast)
  ())
