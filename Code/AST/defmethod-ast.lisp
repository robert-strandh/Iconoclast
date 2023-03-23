(cl:in-package #:iconoclast)

(defclass specialized-parameter-ast (name-ast-mixin ast)
  ((%specializer-ast
    :initform nil
    :initarg :specializer-ast
    :reader specializer-ast)))

(defclass defmethod-ast
    (name-ast-mixin
     lambda-list-ast-mixin
     declaration-asts-mixin
     documentation-ast-mixin
     form-asts-mixin
     ast)
  ((%method-qualifier-asts
    :initform '()
    :initarg :method-qualifier-asts
    :reader method-qualifier-asts)))
