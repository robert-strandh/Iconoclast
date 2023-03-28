(cl:in-package #:iconoclast)

(defclass restart-binding-ast (name-ast-mixin ast)
  (;; Maybe factor out this slot.  See for instance
   ;; MULTIPLE-VALUE-CALL-AST.
   (%function-form-ast
    :initarg :function-form-ast
    :reader function-form-ast)))

(defmethod children ((ast restart-binding-ast))
  (list (cons "function-form-ast" (function-form-ast ast))))

(defclass restart-bind-ast (form-asts-mixin ast)
  ((%restart-binding-asts
    :initform '()
    :initarg :restart-binding-asts
    :reader restart-binding-asts)))
