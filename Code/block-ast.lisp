(cl:in-package #:iconoclast)

(defclass block-ast (ast)
  (;; This slot contains a LITERAL-AST with the name of the block.
   (%name-ast
      :initarg :name-ast
      :reader name-ast)
   ;; This slot contains a list of ASTs that are make up the body of the block.
   (%form-asts
      :initarg :form-asts
      :reader form-asts)))

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
