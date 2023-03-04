(cl:in-package #:iconoclast)

(defclass block-ast (name-ast-mixin form-asts-mixin ast)
  ())

(defclass return-from-ast (ast)
  (;; This slot contains the BLOCK-AST that is being returned from.
   (%block-ast
      :initarg :block-ast
      :reader block-ast)
   ;; This slot contains the ast of the form to return. If the source
   ;; code does not have the optional return form, then this slot
   ;; nevertheless contains a LITERAL-AST with NIL in it, but that AST
   ;; contains NIL in the ORIGIN slot.
   (%form-ast
      :initarg :form-ast
      :reader form-ast)))
