(cl:in-package #:iconoclast)

(defgeneric place-asts (ast))

(defclass setf-or-psetf-ast (form-asts-mixin ast)
  ((%place-asts
      :initform '()
      :initarg :place-asts
      :reader place-asts)))

(defmethod children append ((ast setf-or-psetf-ast))
  (list (cons "place-asts" (place-asts ast))))

(defclass setf-ast (setf-or-psetf-ast)
  ())

(defclass psetf-ast (setf-or-psetf-ast)
  ())
