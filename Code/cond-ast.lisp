(cl:in-package #:iconoclast)

(defclass cond-clause-ast (test-ast-mixin form-asts-mixin ast)
  ())

(defgeneric clause-asts (ast))

(defclass cond-ast (ast)
  ((%clause-asts
      :initform '()
      :initarg :clause-asts
      :reader clause-asts)))

(defmethod children append ((ast cond-ast))
  (list (cons "clause-asts" (clause-asts ast))))
