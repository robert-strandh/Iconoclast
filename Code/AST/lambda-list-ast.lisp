(cl:in-package #:iconoclast)

(define-ast-class required-section-ast-mixin ()
  ((? required-section-ast)))

(define-ast-class optional-section-ast-mixin ()
  ((? optional-section-ast)))

(define-ast-class rest-section-ast-mixin ()
  ((? rest-section-ast)))

(define-ast-class key-section-ast-mixin ()
  ((? key-section-ast)))

(define-ast-class aux-section-ast-mixin ()
  ((? aux-section-ast)))

(define-ast-class section-ast (ast)
  ())

(define-ast-class single-parameter-section-ast (section-ast)
  ((1 parameter-ast)))

(define-ast-class multi-parameter-section-ast (section-ast)
  ((* parameter-asts)))

(define-ast-class required-section-ast (multi-parameter-section-ast)
  ())

(define-ast-class lambda-list-keyword-ast-mixin (name-ast-mixin)
  ())

(define-ast-class optional-section-ast
       (lambda-list-keyword-ast-mixin multi-parameter-section-ast)
  ())

(define-ast-class rest-section-ast
    (lambda-list-keyword-ast-mixin single-parameter-section-ast)
  ())

(define-ast-class key-section-ast
    (lambda-list-keyword-ast-mixin multi-parameter-section-ast)
  ())

(define-ast-class keyword-ast (name-mixin ast)
  ())

(define-ast-class aux-section-ast
    (lambda-list-keyword-ast-mixin multi-parameter-section-ast)
  ())

(define-ast-class environment-section-ast
    (lambda-list-keyword-ast-mixin single-parameter-section-ast)
  ())

(define-ast-class whole-section-ast
    (lambda-list-keyword-ast-mixin single-parameter-section-ast)
  ())

(define-ast-class lambda-list-keyword-ast (name-mixin ast)
  ())

(define-ast-class whole-section-ast-mixin ()
  ((? whole-section-ast)))

(define-ast-class environment-section-ast-mixin ()
  ((? environment-section-ast)))

(define-ast-class lambda-list-ast (ast)
  ())

(define-ast-class ordinary-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-section-ast-mixin
     lambda-list-ast)
  ())

(define-ast-class generic-function-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     lambda-list-ast)
  ())

(define-ast-class specialized-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-section-ast-mixin
     lambda-list-ast)
  ())

(define-ast-class macro-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-section-ast-mixin
     whole-section-ast-mixin
     environment-section-ast-mixin
     lambda-list-ast)
  ())

(define-ast-class destructuring-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-section-ast-mixin
     whole-section-ast-mixin
     lambda-list-ast)
  ())

(define-ast-class boa-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-section-ast-mixin
     lambda-list-ast)
  ())

(define-ast-class defsetf-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     environment-section-ast-mixin
     lambda-list-ast)
  ())

(define-ast-class deftype-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-section-ast-mixin
     whole-section-ast-mixin
     environment-section-ast-mixin
     lambda-list-ast)
  ())

(define-ast-class define-modify-macro-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     lambda-list-ast)
  ())

(define-ast-class define-method-combination-arguments-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-section-ast-mixin
     whole-section-ast-mixin
     lambda-list-ast)
  ())

(define-ast-class lambda-list-ast-mixin ()
  ((1 lambda-list-ast)))

(define-ast-class parameter-ast (name-ast-mixin ast)
  ())

(define-ast-class required-parameter-ast (parameter-ast)
  ())

(define-ast-class init-form-ast-mixin ()
  ((? init-form-ast)))

(define-ast-class supplied-p-parameter-ast-mixin ()
  ((? supplied-p-parameter-ast)))

(define-ast-class optional-parameter-ast
    (init-form-ast-mixin
     supplied-p-parameter-ast-mixin
     parameter-ast)
  ())

(define-ast-class key-parameter-ast
    (supplied-p-parameter-ast-mixin
     init-form-ast-mixin
     parameter-ast)
  ((? keyword-ast)))

(define-ast-class aux-parameter-ast
    (init-form-ast-mixin
     parameter-ast)
  ())

(define-ast-class pattern-ast (destructuring-lambda-list-ast)
  ())
