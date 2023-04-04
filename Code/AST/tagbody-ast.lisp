(cl:in-package #:iconoclast)

(defgeneric segment-asts (ast))

(defclass tagbody-ast (ast)
  ((%segment-asts
      :initform '()
      :initarg :segment-asts
      :reader segment-asts)))

(defmethod children append ((ast tagbody-ast))
  (list (cons "segment-asts" (segment-asts ast))))

(defclass tagbody-segment-ast (form-asts-mixin tag-ast-mixin ast)
  ())

(defclass go-ast (tag-ast-mixin ast)
  ())
