(cl:in-package #:iconoclast)

(defclass block-name-ast (name-ast)
  ())

(defgeneric block-name-reference-asts (block-name-definition-ast))

;;; We do not define a method on CHILDREN for this AST because that
;;; would create a cycle in the AST graph.
(defclass block-name-definition-ast (block-name-ast)
  ((%block-name-reference-asts
    :initform '()
    :initarg :block-name-reference-asts
    :reader block-name-reference-asts)))

(defgeneric block-name-definition-ast (block-name-reference-ast))

;;; We do not define a method on CHILDREN for this AST because that
;;; would create a cycle in the AST graph.
(defclass block-name-reference-ast (block-name-ast)
  ((%block-name-definition-ast
    :initform '()
    :initarg :block-name-definition-ast
    :reader block-name-definition-ast)))

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
