(cl:in-package #:iconoclast)

(defgeneric then-ast (ast))

(defgeneric else-ast (ast))

(defclass if-ast (test-ast-mixin ast)
  ((%then-ast
      :initarg :then-ast
      :reader then-ast)
   (%else-ast
      :initform nil
      :initarg :else-ast
      :reader else-ast)))

(defmethod children append ((ast if-ast))
  (list (cons "then-ast" (then-ast ast))
        (cons "else-ast" (else-ast ast))))
