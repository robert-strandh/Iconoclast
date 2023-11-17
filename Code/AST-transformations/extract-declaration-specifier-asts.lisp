(cl:in-package #:iconoclast-ast-transformations)

;;; This function takes a list of DECLARATION-ASTs, and returns a list
;;; of the declaration specifiers present in those DECLARATION-ASTs.
(defun extract-declaration-specifier-asts (declaration-asts)
  (loop for declaration-ast in declaration-asts
        append (ico:declaration-specifier-asts declaration-ast)))

;;; This function takes a list of DECLARATION-ASTs, and return a list
;;; of VARIABLE-NAME-ASTs (with possible duplicates) that occur in any
;;; SPECIAL-AST in any of the DECLARATION-SPECIFIER-ASTs in any of the
;;; DECLARATION-ASTs passed as an argument.
(defun extract-special-declared-variable-asts (declaration-asts)
  (let ((declaraton-specifier-asts
          (extract-declaration-specifier-asts declaration-asts)))
    (loop for declaraton-specifier-ast in declaraton-specifier-asts
          when (typep declaraton-specifier-ast 'ico:special-ast)
            append (ico:name-asts declaraton-specifier-ast))))
