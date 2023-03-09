(cl:in-package #:iconoclast)

;;; FIXME: How do we distinguish between a clause that
;;; has the key (say) A and one that has the key (A)?

(defgeneric key-asts (ast))

(defclass case-normal-clause-ast (form-asts-mixin ast)
  ((%key-asts
      :initform '()
      :initarg :key-asts
      :reader key-asts)))

(defclass case-ast (ast)
  ())