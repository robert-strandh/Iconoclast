(cl:in-package #:iconoclast)

(defclass defgeneric-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     documentation-ast-mixin
     ast)
  ((%generic-function-class-ast
    :initarg :generic-function-class-ast
    :reader generic-function-class-ast)
   (%method-class-ast
    :initarg :method-class-ast
    :reader method-class-ast)))

(defmethod children append ((ast defgeneric-ast))
  (list (cons "generic-function-class-ast"
              (generic-function-class-ast ast))
        (cons "method-class-ast"
              (method-class-ast ast))))
