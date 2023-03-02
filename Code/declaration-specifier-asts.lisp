(cl:in-package #:iconoclast)

(defclass declaration-specifier-ast (ast)
  ())

(defclass declaration-specifier-with-variables-ast
    (declaration-specifier-ast)
  (;; This slot contains a( possibly empty) list of VARIABLE- ASTs.
   (%variable-asts
      :initarg :variable-asts
      :reader variable-asts)))

(defclass dynamic-extent-ast
    (declaration-specifier-with-variables-ast)
  ())

(defclass type-or-ftype-ast
    (declaration-specifier-with-variables-ast)
  ((%type-specifier-ast
      :initarg :type-specifier-ast
      :reader type-specifier-ast)))

(defclass type-ast (type-or-ftype-ast)
  ())

(defclass ftype-ast (type-or-ftype-ast)
  ())

(defclass ignore-or-ignorable-ast
    (declaration-specifier-with-variables-ast)
  ())

(defclass ignore-ast (ignore-or-ignorable-ast)
  ())

(defclass ignorable-ast (ignore-or-ignorable-ast)
  ())

(defclass inline-or-notlinline-ast
    (declaration-specifier-with-variables-ast)
  ())

(defclass inline-ast (inline-or-notinline-ast)
  ())

(defclass notinline-ast (inline-or-notinline-ast)
  ())

;;; FIXME: add slot for the qualities.
(defclass optimize-ast (declaration-specifier-ast)
  ())