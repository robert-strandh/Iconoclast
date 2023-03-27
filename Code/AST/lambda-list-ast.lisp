(cl:in-package #:iconoclast)

(defgeneric required-parameter-asts (lambda-list-ast))

(defclass required-parameter-asts-mixin ()
  ((%required-parameter-asts
    :initform '()
    :initarg :required-parameter-asts
    :reader required-parameter-asts)))

(defmethod children append ((ast required-parameter-asts-mixin))
  (list (cons "required-parameter-asts"
              (required-parameter-asts ast))))

(defgeneric optional-parameter-asts (lambda-list-ast))

(defclass optional-parameter-asts-mixin ()
  ((%optional-parameter-asts
    :initform '()
    :initarg :optional-parameter-asts
    :reader optional-parameter-asts)))

(defmethod children append ((ast optional-parameter-asts-mixin))
  (list (cons "optional-parameter-asts"
              (optional-parameter-asts ast))))

(defgeneric rest-parameter-ast (lambda-list-ast))

(defclass rest-parameter-ast-mixin ()
  ((%rest-parameter-ast
    :initform nil
    :initarg :rest-parameter-ast
    :reader rest-parameter-ast)))

(defmethod children append ((ast rest-parameter-ast-mixin))
  (list (cons "rest-parameter-ast"
              (rest-parameter-ast ast))))

(defgeneric key-parameter-asts (lambda-list-ast))

(defclass key-parameter-asts-mixin ()
  ((%key-parameter-asts
    :initform '()
    :initarg :key-parameter-asts
    :reader key-parameter-asts)))

(defmethod children append ((ast key-parameter-asts-mixin))
  (list (cons "key-parameter-asts"
              (key-parameter-asts ast))))

(defgeneric aux-parameter-asts (lambda-list-ast))

(defclass aux-parameter-asts-mixin ()
  ((%aux-parameter-asts
    :initform '()
    :initarg :aux-parameter-asts
    :reader aux-parameter-asts)))

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
    (required-parameter-asts-mixin
     optional-parameter-asts-mixin
     rest-parameter-ast-mixin
     key-parameter-asts-mixin
     aux-parameter-asts-mixin
     lambda-list-ast)
  ())

(defclass generic-function-lambda-list-ast
    (required-parameter-asts-mixin
     optional-parameter-asts-mixin
     rest-parameter-ast-mixin
     key-parameter-asts-mixin
     lambda-list-ast)
  ())

(defclass specialized-lambda-list-ast
    (required-parameter-asts-mixin
     optional-parameter-asts-mixin
     rest-parameter-ast-mixin
     key-parameter-asts-mixin
     aux-parameter-asts-mixin
     lambda-list-ast)
  ())

(defclass macro-lambda-list-ast
    (required-parameter-asts-mixin
     optional-parameter-asts-mixin
     rest-parameter-ast-mixin
     key-parameter-asts-mixin
     aux-parameter-asts-mixin
     whole-parameter-ast-mixin
     environment-parameter-ast-mixin
     lambda-list-ast)
  ())

(defclass destructuring-lambda-list-ast
    (required-parameter-asts-mixin
     optional-parameter-asts-mixin
     rest-parameter-ast-mixin
     key-parameter-asts-mixin
     aux-parameter-asts-mixin
     whole-parameter-ast-mixin
     lambda-list-ast)
  ())

(defclass boa-lambda-list-ast
    (required-parameter-asts-mixin
     optional-parameter-asts-mixin
     rest-parameter-ast-mixin
     key-parameter-asts-mixin
     aux-parameter-asts-mixin
     lambda-list-ast)
  ())

(defclass defsetf-lambda-list-ast
    (required-parameter-asts-mixin
     optional-parameter-asts-mixin
     rest-parameter-ast-mixin
     key-parameter-asts-mixin
     environment-parameter-ast-mixin
     lambda-list-ast)
  ())

(defclass deftype-lambda-list-ast
    (required-parameter-asts-mixin
     optional-parameter-asts-mixin
     rest-parameter-ast-mixin
     key-parameter-asts-mixin
     aux-parameter-asts-mixin
     whole-parameter-ast-mixin
     environment-parameter-ast-mixin
     lambda-list-ast)
  ())

(defclass define-modify-macro-lambda-list-ast
    (required-parameter-asts-mixin
     optional-parameter-asts-mixin
     rest-parameter-ast-mixin
     lambda-list-ast)
  ())

(defclass define-method-combination-arguments-lambda-list-ast
    (required-parameter-asts-mixin
     optional-parameter-asts-mixin
     rest-parameter-ast-mixin
     key-parameter-asts-mixin
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
      :initarg :supplied-p-parameter-ast
      :reader supplied-p-parameter-ast)))

(defmethod children append ((ast supplied-p-parameter-ast-mixin))
  (list (cons "supplied-p-parameter-ast" (supplied-p-parameter-ast ast))))

(defclass optional-parameter-ast
    (init-form-ast-mixin
     supplied-p-parameter-ast-mixin
     parameter-ast)
  ())

(defgeneric keyword-name-ast (parameter-ast))

(defclass key-parameter-ast
    (supplied-p-parameter-ast-mixin
     init-form-ast-mixin
     parameter-ast)
  ((%keyword-name-ast
      :initform nil
      :initarg :keyword-name-ast
      :reader keyword-name-ast)))

(defmethod children append ((ast key-parameter-ast))
  (list (cons "keyword-name-ast" (keyword-name-ast ast))))
