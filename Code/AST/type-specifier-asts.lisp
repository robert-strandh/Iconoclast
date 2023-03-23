(cl:in-package #:iconoclast)

(defclass type-specifier-ast (name-ast-mixin ast)
  ())

(defclass atomic-type-specifier-ast (type-specifier-ast)
  ())

(defclass subsidiary-item-ast (ast)
  ((%value
    :initarg :value
    :reader value)))

(defclass compound-type-specifier-ast (type-specifier-ast)
  ((%subsidiary-item-asts
    :initform '()
    :initarg :subsidiary-item-asts
    :reader subsidiary-item-asts)
   (%atomic-type-specifier-ast
    :initform nil
    :initarg :atomic-type-specifier-ast
    :reader atomic-type-specifier-ast)))

(defmethod children append ((ast compound-type-specifier-ast))
  (list (cons "subsidiary-item-asts" (subsidiary-item-asts ast))
        (cons "atomic-type-specifier-ast" (atomic-type-specifier-ast ast))))
