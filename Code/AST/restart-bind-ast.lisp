(cl:in-package #:iconoclast)

(defclass restart-binding-ast (name-ast-mixin ast)
  (;; Maybe factor out this slot.  See for instance
   ;; MULTIPLE-VALUE-CALL-AST.
   (%function-form-ast
    :initarg :function-form-ast
    :reader function-form-ast)
   (%interactive-function-ast
    :initform nil
    :initarg :interactive-function-ast
    :reader interactive-function-ast)
   (%report-function-ast
    :initform nil
    :initarg :report-function-ast
    :reader report-function-ast)
   (%test-function-ast
    :initform nil
    :initarg :test-function-ast
    :reader test-function-ast)))

(defmethod children append ((ast restart-binding-ast))
  (list (cons "function-form-ast" (function-form-ast ast))))

(defclass restart-bind-ast (binding-asts-mixin form-asts-mixin ast)
  ())
