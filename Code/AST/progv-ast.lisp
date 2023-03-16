(cl:in-package #:iconoclast)

(defgeneric symbols-ast (ast))

(defgeneric values-ast (ast))

(defclass progv-ast (form-asts-mixin ast)
  ((%symbols-ast
      :initarg :symbols-ast
      :reader symbols-ast)
   (%values-ast
      :initarg :values-ast
      :reader values-ast)))

(defmethod children append ((ast progv-ast))
  (list (cons "symbols-ast" (symbols-ast ast))
        (cons "values-ast" (values-ast ast))))
