(cl:in-package #:iconoclast)

(defgeneric required-parameter-asts (lambda-list-ast))

(defclass required-parameter-asts-mixin ()
  ((%required-parameter-asts
    :initform '()
    :initarg :required-parameter-asts
    :reader required-parameter-asts)))

(defgeneric optional-parameter-asts (lambda-list-ast))

(defclass optional-parameter-asts-mixin ()
  ((%optional-parameter-asts
    :initform '()
    :initarg :optional-parameter-asts
    :reader optional-parameter-asts)))

(defgeneric rest-parameter-ast (lambda-list-ast))

(defclass rest-parameter-ast-mixin ()
  ((%rest-parameter-ast
    :initform nil
    :initarg :rest-parameter-ast
    :reader rest-parameter-ast)))

(defgeneric key-parameter-asts (lambda-list-ast))

(defclass key-parameter-asts-mixin ()
  ((%key-parameter-asts
    :initform '()
    :initarg :key-parameter-asts
    :reader key-parameter-asts)))

(defgeneric aux-parameter-asts (lambda-list-ast))

(defclass aux-parameter-asts-mixin ()
  ((%aux-parameter-asts
    :initform '()
    :initarg :aux-parameter-asts
    :reader aux-parameter-asts)))

(defgeneric whole-parameter-ast (lambda-list-ast))

(defclass whole-parameter-ast-mixin ()
  ((%whole-parameter-ast
    :initform nil
    :initarg :whole-parameter-ast
    :reader whole-parameter-ast)))

(defgeneric environment-parameter-ast (lambda-list-ast))

(defclass environment-parameter-ast-mixin ()
  ((%environment-parameter-ast
    :initform nil
    :initarg :environment-parameter-ast
    :reader environment-parameter-ast)))

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

(defclass parameter-ast (name-ast-mixin ast)
  ())

(defclass required-parameter-ast (parameter-ast)
  ())
