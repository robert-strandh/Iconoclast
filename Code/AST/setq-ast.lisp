(cl:in-package #:iconoclast)

(defgeneric variable-name-asts (ast))

(defclass setq-ast (form-asts-mixin ast)
  ((%variable-name-asts
      :initform '()
      :initarg :variable-name-asts
      :reader variable-name-asts)))

(defmethod children append ((ast setq-ast))
  (list (cons "variable-name-asts" (variable-asts ast))))
