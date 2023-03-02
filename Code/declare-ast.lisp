(cl:in-package #:iconoclast)

(defgeneric declaration-specifiers (declare-ast))

(defclass declare-ast (ast)
  (;; This slot contains a (possibly empty) list of DECLARATION-
   ;; SPECIFIER-ASTs.
   (%declaration-specifiers
      :initarg :declaration-specifiers
      :reader declaration-specifiers)))
