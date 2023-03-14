(cl:in-package #:iconoclast)

(defgeneric segment-asts (ast))

(defclass tagbody-ast (ast)
  ((%segment-asts
      :initform '()
      :initarg :segment-asts
      :reader segment-asts)))

(defmethod children append ((ast tagbody-ast))
  (list (cons "segment-asts" (segment-asts ast))))

(defgeneric tag-asts (ast))

(defclass tagbody-segment-ast (form-asts-mixin ast)
  ((%tag-asts
      :initform '()
      :initarg :tag-asts
      :reader tag-asts)))

(defmethod children append ((ast tagbody-segment-ast))
  (list (cons "tag-asts" (tag-asts ast))))

(defclass tagbody-tag-ast (tag-ast-mixin ast)
  ((%tagbody-ast
      :initarg :tagbody-ast
      :reader tagbody-ast)))

(defmethod children append ((ast tagbody-tag-ast))
  (list (cons "tagbody-ast" (tagbody-ast ast))))

(defclass go-ast (tag-ast-mixin ast)
  ())
