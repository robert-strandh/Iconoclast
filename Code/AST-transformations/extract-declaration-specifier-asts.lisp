(cl:in-package #:iconoclast-ast-transformations)

;;; This function takes a list of DECLARATION-ASTs, and returns a list
;;; of the declaration specifiers present in those DECLARATION-ASTs.
(defun extract-declaration-specifier-asts (declaration-asts)
  (loop for declaration-ast in declaration-asts
        append (ico:declaration-specifier-asts declaration-ast)))
