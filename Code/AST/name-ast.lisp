(cl:in-package #:iconoclast)

(define-ast-class name-ast (name-mixin ast)
  ())

(define-ast-class variable-name-ast (name-ast)
  ())

;;; FIXME: We do not want to define a method on CHILDREN for this AST
;;; because that would create a cycle in the AST graph.
(define-ast-class variable-definition-ast (variable-name-ast)
  (;; This slot contains a list of VARIABLE-REFERENCE-ASTs
   (* variable-reference-asts)))

;;; FIXME: We do not want to define a method on CHILDREN for this AST
;;; because that would create a cycle in the AST graph.
(define-ast-class variable-reference-ast (variable-name-ast)
  (;; This slot contains the VARIABLE-DEFINITION-AST that defines the
   (? variable-definition-ast)))

(define-ast-class special-variable-bound-ast (variable-name-ast)
  ())

(define-ast-class special-variable-reference-ast (variable-name-ast)
  ())

(define-ast-class function-name-ast (name-ast)
  ())

(define-ast-class type-name-ast (name-ast)
  ())
