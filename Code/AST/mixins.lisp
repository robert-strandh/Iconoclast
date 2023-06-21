(cl:in-package #:iconoclast)

(define-ast-class form-ast-mixin ()
  ((1 form-ast)))

(define-ast-class place-ast-mixin ()
  ((1 place-ast)))

(define-ast-class form-asts-mixin ()
  ((* form-asts)))

(define-ast-class declaration-asts-mixin ()
  ((* declaration-asts)))

(define-ast-class documentation-ast-mixin ()
  ((1 documentation-ast)))

(define-ast-class name-ast-mixin ()
  ((1 name-ast)))

(define-ast-class tag-ast-mixin ()
  ((1 tag-ast)))

(define-ast-class test-ast-mixin ()
  ((1 test-ast)))

(define-ast-class variable-name-ast-mixin ()
  ((1 variable-name-ast)))

(define-ast-class name-mixin ()
  ((1 name)))

;;; This class can be mixed into classes that need to store several
;;; names.
(define-ast-class name-asts-mixin ()
  ((* name-asts)))

(define-ast-class clause-asts-mixin ()
  ((* clause-asts)))

(define-ast-class type-specifier-ast-mixin ()
  ((1 type-specifier-ast)))

(define-ast-class value-mixin ()
  ((1 value)))

(define-ast-class slot-specifier-asts-mixin ()
  ((* slot-specifier-asts)))

(define-ast-class default-initarg-asts-mixin ()
  ((* default-initarg-asts)))

(define-ast-class initform-ast-mixin ()
  ((1 initform-ast)))

(define-ast-class superclass-asts-mixin ()
  ((* superclass-asts)))
