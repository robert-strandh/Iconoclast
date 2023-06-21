(cl:in-package #:iconoclast)

(define-ast-class block-name-ast (name-ast)
  ())

;;; FIXME: We do not want to define a method on CHILDREN for this AST
;;; because that would create a cycle in the AST graph.
(define-ast-class block-name-definition-ast (block-name-ast)
  ((* block-name-reference-asts)))

;;; FIXME: We do not want to define a method on CHILDREN for this AST
;;; because that would create a cycle in the AST graph.
(define-ast-class block-name-reference-ast (block-name-ast)
  ((? block-name-definition-ast)))

(define-ast-class block-ast (name-ast-mixin form-asts-mixin ast)
  ())

(define-ast-class return-from-ast (name-ast-mixin form-ast-mixin ast)
  ())
