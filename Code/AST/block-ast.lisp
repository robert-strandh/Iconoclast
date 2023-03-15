(cl:in-package #:iconoclast)

(defclass block-name-ast (name-ast)
  ())

(defclass block-ast (name-ast-mixin form-asts-mixin ast)
  ())

(defclass return-from-ast (form-ast-mixin ast)
  (;; This slot contains the BLOCK-AST that is being returned from.
   (%block-ast
      :initarg :block-ast
      :reader block-ast))
  (:default-initargs :form-ast nil))

(defmethod children append ((ast return-from-ast))
  (list (cons "block-ast" (block-ast ast))))
