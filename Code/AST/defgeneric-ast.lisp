(cl:in-package #:iconoclast)

(defclass defgeneric-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     documentation-ast-mixin
     ast)
  ((%generic-function-class-ast
    :initform nil
    :initarg :generic-function-class-ast
    :reader generic-function-class-ast)
   (%method-class-ast
    :initform nil
    :initarg :method-class-ast
    :reader method-class-ast)
   (%method-combination-name-and-arguments-ast
    :initform nil
    :initarg :method-combination-name-and-arguments-ast
    :reader method-combination-name-and-arguments-ast)
   (%method-description-asts
    :initform '()
    :initarg :method-description-asts
    :reader method-description-asts)))

(defmethod children append ((ast defgeneric-ast))
  (list (cons "generic-function-class-ast"
              (generic-function-class-ast ast))
        (cons "method-class-ast"
              (method-class-ast ast))
        (cons "method-combination-name-and-arguments-ast"
              (method-combination-name-and-arguments-ast ast))
        (cons "method-description-asts"
              (method-description-asts ast))))

(defclass method-combination-name-and-arguments-ast
    (name-ast-mixin
     ast)
  ((%method-combination-arguments
    :initform '()
    :initarg :method-combination-arguments
    :reader method-combination-arguments)))

(defmethod children append
    ((ast method-combination-name-and-arguments-ast))
  (list (cons "method-combination-arguments"
              (method-combination-arguments ast))))

(defclass method-description-ast
    (lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     form-asts-mixin
     ast)
  ((%method-qualifier-asts
    :initform '()
    :initarg :method-qualifier-asts
    :reader method-qualifier-asts)))

(defmethod children append ((ast defmethod-ast))
  (list (cons "method-qualifier-asts" (method-qualifier-asts ast))))
