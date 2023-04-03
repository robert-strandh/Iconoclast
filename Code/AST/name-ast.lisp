(cl:in-package #:iconoclast)

(defclass name-ast (name-mixin ast)
  ())

(defclass variable-name-ast (name-ast)
  ())

(defgeneric variable-reference-asts (variable-definition-ast))

;;; We do not define a method on CHILDREN for this AST because that
;;; would create a cycle in the AST graph.
(defclass variable-definition-ast (variable-name-ast)
  (;; This slot contains a list of ASTs that are references to this
   ;; VARIABLE-DEFINITION-AST.
   (%variable-reference-asts
    :initform '()
    :initarg :variable-reference-asts
    :reader variable-reference-asts)))

(defgeneric variable-definition-ast (variable-reference-ast))

;;; We do not define a method on CHILDREN for this AST because that
;;; would create a cycle in the AST graph.
(defclass variable-reference-ast (variable-name-ast)
  (;; This slot contains the VARIABLE-DEFINITION-AST that defines the
   ;; variable being referred to.
   (%variable-definition-ast
    :initarg :variable-definition-ast
    :reader variable-definition-ast)))

(defclass function-name-ast (name-ast)
  ())

(defclass type-name-ast (name-ast)
  ())
