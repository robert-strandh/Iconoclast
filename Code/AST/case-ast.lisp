(cl:in-package #:iconoclast)

;;; FIXME: How do we distinguish between a clause that
;;; has the key (say) A and one that has the key (A)?

(defgeneric key-asts (ast))

(defclass case-normal-clause-ast (form-asts-mixin ast)
  ((%key-asts
      :initform '()
      :initarg :key-asts
      :reader key-asts)))

(defmethod children append ((ast case-normal-clause-ast))
  (list (cons "key-asts" (key-asts ast))))

(defclass case-or-ecase-ast
    (form-ast-mixin clause-asts-mixin ast)
  ())

(defclass case-ast (case-or-ecase-ast)
  ())

(defclass ecase-ast (case-or-ecase-ast)
  ())

(defclass ccase-ast (place-ast-mixin clause-asts-mixin ast)
  ())
