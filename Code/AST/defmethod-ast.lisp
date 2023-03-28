(cl:in-package #:iconoclast)

(defclass specialized-parameter-ast (name-ast-mixin ast)
  ((%specializer-ast
    :initform nil
    :initarg :specializer-ast
    :reader specializer-ast)))

(defmethod children append ((ast specialized-parameter-ast))
  (list (cons "specializer-ast" (specializer-ast ast))))

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

(defmethod children append ((ast defmethod-ast))
  (list (cons "method-qualifier-asts" (method-qualifier-asts ast))))
