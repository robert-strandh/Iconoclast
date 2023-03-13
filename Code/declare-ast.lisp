(cl:in-package #:iconoclast)

(defgeneric declaration-specifier-asts (declare-ast))

(defclass declare-ast (ast)
  (;; This slot contains a (possibly empty) list of DECLARATION-
   ;; SPECIFIER-ASTs.
   (%declaration-specifier-asts
      :initarg :declaration-specifier-asts
      :reader declaration-specifier-asts)))

(defmethod children append ((ast declare-ast))
  (list (cons "declaration-specifier-asts"
              (declaration-specifier-asts ast))))
