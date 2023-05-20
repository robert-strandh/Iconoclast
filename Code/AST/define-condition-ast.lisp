(cl:in-package #:iconoclast)

(defclass define-condition-ast
    (documentation-ast-mixin
     slot-specifier-asts-mixin
     name-ast-mixin
     default-initarg-asts-mixin
     ast)
  ((%report-ast
    :initform nil
    :initarg :report-ast
    :reader report-ast)))

(defmethod children append ((ast define-condition-ast))
  (list (cons "report-ast" (report-ast ast))))

(defclass condition-report-ast (ast)
  ((%argument-ast
    :initarg :argument-ast
    :reader argument-ast)))

(defmethod children append ((ast define-condition-ast))
  (list (cons "argument-ast" (argument-ast ast))))
