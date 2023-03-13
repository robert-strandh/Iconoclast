(cl:in-package #:iconoclast)

;;; FIXME: Maybe rename this one to SEGMENT-ASTS?
(defgeneric contents-asts (ast))

(defclass tagbody-ast (ast)
  ((%contents-asts
      :initform '()
      :initarg :contents-asts
      :reader contents-asts)))

(defmethod children append ((ast tagbody-ast))
  (list (cons "contents-asts" (contents-asts ast))))

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
