(cl:in-package #:iconoclast)

(define-ast-class declaration-specifier-ast (ast)
  ((%identifier-ast
    :initarg :identifier-ast
    :reader identifier-ast)))

(export 'identifier-ast)

(define-ast-class unknown-declaration-specifier-ast
    (declaration-specifier-ast)
  ((* argument-asts)))

;;; What we call a RESTRICTING-DECLARATION-SPECIFIER-AST is a
;;; DECLARATION-SPECIFIER-AST that applies to a variable or a
;;; function, so it contains a list of NAME-ASTs 
(define-ast-class restricting-declaration-specifier-ast
    (name-asts-mixin declaration-specifier-ast)
  ())

(define-ast-class dynamic-extent-ast (restricting-declaration-specifier-ast)
  ())

(define-ast-class type-or-ftype-ast
    (type-specifier-ast-mixin restricting-declaration-specifier-ast)
  ())

(define-ast-class type-ast (type-or-ftype-ast)
  ())

(define-ast-class ftype-ast (type-or-ftype-ast)
  ())

(define-ast-class ignore-or-ignorable-ast
    (restricting-declaration-specifier-ast)
  ())

(define-ast-class ignore-ast (ignore-or-ignorable-ast)
  ())

(define-ast-class ignorable-ast (ignore-or-ignorable-ast)
  ())

(define-ast-class inline-or-notinline-ast
    (restricting-declaration-specifier-ast)
  ())

(define-ast-class inline-ast (inline-or-notinline-ast)
  ())

(define-ast-class notinline-ast (inline-or-notinline-ast)
  ())

(define-ast-class special-ast (restricting-declaration-specifier-ast)
  ())

(define-ast-class optimize-quality-ast (value-mixin ast)
  ())

(define-ast-class speed-ast (optimize-quality-ast)
  ())

(define-ast-class compilation-speed-ast (optimize-quality-ast)
  ())

(define-ast-class space-ast (optimize-quality-ast)
  ())

(define-ast-class debug-ast (optimize-quality-ast)
  ())

(define-ast-class safety-ast (optimize-quality-ast)
  ())

(define-ast-class optimize-ast (declaration-specifier-ast)
  ((* quality-asts)))
