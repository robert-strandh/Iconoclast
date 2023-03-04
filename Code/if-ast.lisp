(cl:in-package #:iconoclast)

(defgeneric test-ast (ast))

(defgeneric then-ast (ast))

(defgeneric else-ast (ast))

(defclass if-ast (ast)
  ((%test-ast
      :initarg :test-ast
      :reader test-ast)
   (%then-ast
      :initarg :then-ast
      :reader then-ast)
   ;; When there is no else branch in teh source code, this slot
   ;; contains a LITERAL- AST with NIL in it, but the origin slot of
   ;; that AST has NIL in it.
   (%else-ast
      :initarg :else-ast
      :reader else-ast)))