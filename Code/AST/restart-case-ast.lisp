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

(defmethod children append ((ast restart-clause-ast))
  (list (cons "report-ast" (report-ast ast))
        (cons "interactive-ast" (interactive-ast ast))
        (cons "test-ast" (test-ast ast))))

(defclass restart-case-ast (clause-asts-mixin form-ast-mixin ast)
  ())
