(cl:in-package #:iconoclast)

(defgeneric variable-asts (ast))

(defclass setq-ast (form-asts-mixin ast)
  ((%variable-asts
      :initform '()
      :initarg :variable-asts
      :reader variable-asts)))

(defmethod children append ((ast setq-ast))
  (list (cons "variable-asts" (variable-asts ast))))
