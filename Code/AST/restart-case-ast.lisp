(cl:in-package #:iconoclast)

(defgeneric report-ast (report-clause-ast))

(defclass restart-clause-ast
    (form-asts-mixin
     declaration-asts-mixin
     lambda-list-ast-mixin
     name-ast-mixin
     ast)
  ((%report-ast
    :initform nil
    :initarg :report-ast
    :reader report-ast)
   (%interactive-ast
    :initform nil
    :initarg :interactive-ast
    :reader interactive-ast)
   (%test-ast
    :initform nil
    :initarg :test-ast
    :reader test-ast)))

(defclass restart-case-ast (form-ast-mixin ast)
  ((%clause-asts
    :initform '()
    :initarg :clause-asts
    :reader clause-asts)))
