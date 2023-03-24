(cl:in-package #:iconoclast)

(defgeneric variable-name-asts (ast))

(defclass setq-or-psetq-ast (form-asts-mixin ast)
  ((%variable-name-asts
      :initform '()
      :initarg :variable-name-asts
      :reader variable-name-asts)))

(defmethod children append ((ast setq-or-psetq-ast))
  (list (cons "variable-name-asts" (variable-name-asts ast))))

(defclass setq-ast (setq-or-psetq-ast)
  ())

(defclass psetq-ast (setq-or-psetq-ast)
  ())
