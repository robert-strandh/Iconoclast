(cl:in-package #:iconoclast-ast-transformations)

;;; This function takes a RESTRICTING-DECLARATION-SPECIFIER-AST and
;;; returns a list of pairs (<name-ast> . <declaration-specifier-ast>)
;;; such that <declaration-specifier-ast> is a
;;; DECLARATION-SPECIFIER-AST of the same type as the argument to this
;;; function, and it contains a single NAME-AST that can be either a
;;; VARIABLE-REFERENCE-AST, a SPECIAL-VARIABLE-REFERENCE-AST, a
;;; FUNCTION-REFERENCE-AST, or a GLOBAL-FUNCTION-NAME-REFERENCE-AST.
;;; The <name-ast> is the same as the one contained in
;;; <declaration-specifier-ast>.
;;;
;;; We do it this way because client code is allowed to define
;;; specific DECLARATION-SPECIFIER-AST types, and we can't know how to
;;; create one of those, so for such a specific AST type, we require
;;; client code to define a method on this function.

(defgeneric split-declaration-specifier-ast
    (restricted-declaration-specifier-ast))

(defmethod split-declaration-specifier-ast
    ((ast ico:restricted-declaration-specifier-ast))
  (loop with origin = (ico:origin ast)
        with class = (class-of ast)
        for name-ast in (ico:name-asts ast)
        for declaration-specifier-ast
          = (make-instance class
              :identifier-ast
              (make-instance 'ico:name-ast
                :name (ico:name (ico:identifier-ast ast)))
              :name-asts (list name-ast)
              :origin origin)
        collect (cons name-ast declaration-specifier-ast)))

(defmethod split-declaration-specifier-ast
    ((ast ico:type-or-ftype-ast))
  (loop with origin = (ico:origin ast)
        with class = (class-of ast)
        with type-specifier-ast = (ico:type-specifier-ast ast)
        for name-ast in (ico:name-asts ast)
        for declaration-specifier-ast
          = (make-instance class
              :identifier-ast
              (make-instance 'ico:name-ast
                :name (ico:name (ico:identifier-ast ast)))
              :type-specifier-ast type-specifier-ast
              :name-asts (list name-ast)
              :origin origin)
        collect (cons name-ast declaration-specifier-ast)))
