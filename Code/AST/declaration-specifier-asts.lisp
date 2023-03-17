(cl:in-package #:iconoclast)

(defclass declaration-specifier-ast (ast)
  ())

(defclass dynamic-extent-ast (name-asts-mixin declaration-specifier-ast)
  ())

(defclass type-or-ftype-ast (name-asts-mixin declaration-specifier-ast)
  ((%type-specifier-ast
      :initarg :type-specifier-ast
      :reader type-specifier-ast)))

(defclass type-ast (type-or-ftype-ast)
  ())

(defclass ftype-ast (type-or-ftype-ast)
  ())

(defclass ignore-or-ignorable-ast (name-asts-mixin declaration-specifier-ast)
  ())

(defclass ignore-ast (ignore-or-ignorable-ast)
  ())

(defclass ignorable-ast (ignore-or-ignorable-ast)
  ())

(defclass inline-or-notinline-ast (name-asts-mixin declaration-specifier-ast)
  ())

(defclass inline-ast (inline-or-notinline-ast)
  ())

(defclass notinline-ast (inline-or-notinline-ast)
  ())

(defclass special-ast (name-asts-mixin declaration-specifier-ast)
  ())

(defclass optimize-quality-ast (ast)
  ((%value-ast
    :initarg :value
    :reader value)))

(defclass speed-ast (optimize-quality-ast)
  ())

(defclass compilation-speed-ast (optimize-quality-ast)
  ())

(defclass space-ast (optimize-quality-ast)
  ())

(defclass debug-ast (optimize-quality-ast)
  ())

(defclass safety-ast (optimize-quality-ast)
  ())

(defgeneric quality-ast (ast))

(defgeneric value-ast (ast))

(defclass optimize-ast (declaration-specifier-ast)
  ((%quality-ast
    :initarg :quality-ast
    :reader quality-ast)
   (%value-ast
    :initform nil
    :initarg :value-ast
    :reader value-ast)))
