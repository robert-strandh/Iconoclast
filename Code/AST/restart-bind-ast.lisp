(cl:in-package #:iconoclast)

(defclass restart-binding-ast (name-ast-mixin ast)
  (;; Maybe factor out this slot.  See for instance
   ;; MULTIPLE-VALUE-CALL-AST.
   (%function-form-ast
    :initarg :function-form-ast
    :reader function-form-ast)))

(defmethod children append ((ast restart-binding-ast))
  (list (cons "function-form-ast" (function-form-ast ast))))

(defclass restart-bind-ast (binding-asts-mixin form-asts-mixin ast)
  ())
