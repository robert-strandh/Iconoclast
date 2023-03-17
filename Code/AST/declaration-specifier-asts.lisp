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

;;; FIXME: add slot for the qualities.
(defclass optimize-ast (declaration-specifier-ast)
  ())
