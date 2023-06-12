(cl:in-package #:iconoclast)

(defgeneric required-section-ast (lambda-list-ast))

(defclass required-section-ast-mixin ()
  ((%required-section-ast
    :initform '()
    :initarg :required-section-ast
    :reader required-section-ast)))

(defgeneric optional-section-ast (lambda-list-ast))

(defclass optional-section-ast-mixin ()
  ((%optional-section-ast
    :initform '()
    :initarg :optional-section-ast
    :reader optional-section-ast)))

(defmethod children append ((ast optional-section-ast-mixin))
  (list (cons "optional-section-ast"
              (optional-section-ast ast))))

(defgeneric rest-section-ast (lambda-list-ast))

(defclass rest-section-ast-mixin ()
  ((%rest-section-ast
    :initform '()
    :initarg :rest-section-ast
    :reader rest-section-ast)))

(defmethod children append ((ast rest-section-ast-mixin))
  (list (cons "rest-section-ast"
              (rest-section-ast ast))))

(defgeneric key-section-ast (lambda-list-ast))

(defclass key-section-ast-mixin ()
  ((%key-section-ast
    :initform '()
    :initarg :key-section-ast
    :reader key-section-ast)))

(defmethod children append ((ast key-section-ast-mixin))
  (list (cons "key-section-ast"
              (key-section-ast ast))))

(defgeneric aux-section-ast (lambda-list-ast))

(defclass aux-section-ast-mixin ()
  ((%aux-section-ast
    :initform '()
    :initarg :aux-section-ast
    :reader aux-section-ast)))

(defmethod children append ((ast aux-section-ast-mixin))
  (list (cons "aux-section-ast"
              (aux-section-ast ast))))

(defclass section-ast (ast)
  ((%parameter-asts
    :initform '()
    :initarg :parameter-asts
    :reader parameter-asts)))

(defmethod children append ((ast section-ast))
  (list (cons "parameter-asts" (parameter-asts ast))))

(defclass required-section-ast (section-ast)
  ())

(defclass lambda-list-keyword-ast-mixin (name-ast-mixin)
  ())

(defclass optional-section-ast (lambda-list-keyword-ast-mixin section-ast)
  ())

(defclass rest-section-ast (lambda-list-keyword-ast-mixin section-ast)
  ())

(defclass key-section-ast (lambda-list-keyword-ast-mixin section-ast)
  ())

(defclass keyword-ast (name-mixin ast)
  ())

(defclass aux-section-ast (lambda-list-keyword-ast-mixin section-ast)
  ())

(defclass lambda-list-keyword-ast (name-mixin ast)
  ())

(defmethod children append ((ast aux-parameter-asts-mixin))
  (list (cons "aux-parameter-asts"
              (aux-parameter-asts ast))))

(defgeneric whole-parameter-ast (lambda-list-ast))

(defclass whole-parameter-ast-mixin ()
  ((%whole-parameter-ast
    :initform nil
    :initarg :whole-parameter-ast
    :reader whole-parameter-ast)))

(defmethod children append ((ast whole-parameter-ast-mixin))
  (list (cons "whole-parameter-ast"
              (whole-parameter-ast ast))))

(defgeneric environment-parameter-ast (lambda-list-ast))

(defclass environment-parameter-ast-mixin ()
  ((%environment-parameter-ast
    :initform nil
    :initarg :environment-parameter-ast
    :reader environment-parameter-ast)))

(defmethod children append ((ast environment-parameter-ast-mixin))
  (list (cons "environment-parameter-ast"
              (environment-parameter-ast ast))))

(defclass lambda-list-ast (ast)
  ())

(defclass ordinary-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-parameter-asts-mixin
     lambda-list-ast)
  ())

(defclass generic-function-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     lambda-list-ast)
  ())

(defclass specialized-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-parameter-asts-mixin
     lambda-list-ast)
  ())

(defclass macro-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-parameter-asts-mixin
     whole-parameter-ast-mixin
     environment-parameter-ast-mixin
     lambda-list-ast)
  ())

(defclass destructuring-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-parameter-asts-mixin
     whole-parameter-ast-mixin
     lambda-list-ast)
  ())

(defclass boa-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-parameter-asts-mixin
     lambda-list-ast)
  ())

(defclass defsetf-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     environment-parameter-ast-mixin
     lambda-list-ast)
  ())

(defclass deftype-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-parameter-asts-mixin
     whole-parameter-ast-mixin
     environment-parameter-ast-mixin
     lambda-list-ast)
  ())

(defclass define-modify-macro-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     lambda-list-ast)
  ())

(defclass define-method-combination-arguments-lambda-list-ast
    (required-section-ast-mixin
     optional-section-ast-mixin
     rest-section-ast-mixin
     key-section-ast-mixin
     aux-parameter-asts-mixin
     whole-parameter-ast-mixin
     lambda-list-ast)
  ())

(defgeneric lambda-list-ast (ast))

(defclass lambda-list-ast-mixin ()
  ((%lambda-list-ast
    :initarg :lambda-list-ast
    :reader lambda-list-ast)))

(defmethod children append ((ast lambda-list-ast-mixin))
  (list (cons "lambda-list-ast" (lambda-list-ast ast))))

(defclass parameter-ast (name-ast-mixin ast)
  ())

(defclass required-parameter-ast (parameter-ast)
  ())

(defgeneric init-form-ast (parameter-ast))

(defclass init-form-ast-mixin ()
  ((%init-form-ast
      :initform nil
      :initarg :init-form-ast
      :reader init-form-ast)))

(defmethod children append ((ast init-form-ast-mixin))
  (list (cons "init-form-ast" (init-form-ast ast))))

(defclass supplied-p-parameter-ast-mixin ()
  ((%supplied-p-parameter-ast
      :initform nil
      :initarg :supplied-p-parameter-ast
      :reader supplied-p-parameter-ast)))

(defmethod children append ((ast supplied-p-parameter-ast-mixin))
  (list (cons "supplied-p-parameter-ast" (supplied-p-parameter-ast ast))))

(defclass optional-parameter-ast
    (init-form-ast-mixin
     supplied-p-parameter-ast-mixin
     parameter-ast)
  ())

(defgeneric keyword-ast (parameter-ast))

(defclass key-parameter-ast
    (supplied-p-parameter-ast-mixin
     init-form-ast-mixin
     parameter-ast)
  ((%keyword-ast
      :initform nil
      :initarg :keyword-ast
      :reader keyword-ast)))

(defmethod children append ((ast key-parameter-ast))
  (list (cons "keyword-ast" (keyword-ast ast))))

(defclass pattern-ast (destructuring-lambda-list-ast)
  ())
