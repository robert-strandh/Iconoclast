(cl:in-package #:iconoclast)

(defgeneric package-ast (ast))

(defclass do-symbols-do-external-symbols-ast
    (variable-name-ast-mixin
     result-ast-mixin
     declaration-asts-mixin
     segment-asts-mixin
     ast)
  ((%package-ast
    :initform nil
    :initarg :package-ast
    :reader package-ast)))

(defmethod children append ((ast do-symbols-do-external-symbols-ast))
  (list (cons "package-ast" (package-ast ast))))

(defclass do-symbols-ast (do-symbols-do-external-symbols-ast)
  ())

(defclass do-external-symbols-ast (do-symbols-do-external-symbols-ast)
  ())
