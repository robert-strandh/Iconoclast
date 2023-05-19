(cl:in-package #:iconoclast)

(defgeneric metaclass-ast (defclass-ast))

(defclass defclass-ast
    (documentation-ast-mixin
     slot-specifier-asts-mixin
     name-ast-mixin
     default-initarg-asts-mixin
     ast)
  ((%metaclass-ast
    :initform nil
    :initarg :metaclass-ast
    :reader metaclass-ast)))

(defmethod children append ((ast defclass-ast))
  (list (cons "metaclass-ast" (metaclass-ast ast))))
