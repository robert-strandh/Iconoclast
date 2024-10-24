(cl:in-package #:iconoclast-ast-transformations)

;;; We create a dictionary mapping names to declaration specifiers.
;;; An entry can take one of five forms:
;;;
;;; * The key can be a symbol other than NIL, indicating the name of a
;;;   special variable.  The value is then a list of
;;;   DECLARATION-SPECIFIER-ASTs, each referring to a single
;;;   SPECIAL-VARIABLE-REFERENCE-AST.
;;;
;;; * The key can be a VARIABLE-DEFIINITION-AST, indicating a lexical
;;;   variable.  The value is then a list of declaration specifiers,
;;;   each referring to a single VARIABLE-REFERENCE-AST.
;;;
;;; * The key can be a list of the form (FUNCTION <name>) where <name>
;;;   is a function name, indicating the name of a global function.
;;;   The value is then a list of DECLARATION-SPECIFIER-ASTs, each
;;;   referring to a single GLOBAL-FUNCTION-NAME-REFERENCE-AST.
;;;
;;; * The key can be a FUNCTION-NAME-DEFINITION-AST indicating a local
;;;   function.  The value is then a list of
;;;   DECLARATION-SPECIFIER-ASTs, each referring to a single
;;;   LOCAL-FUNCTION-NAME-REFERENCE-AST.
;;;
;;; * The key can be NIL.  The value is then a list of
;;;   DECLARATION-SPECIFIER-ASTs that do not refer to any variable or
;;;   function.

(defun add-entry (dictionary key value)
  (push value (gethash key dictionary)))

(defun declaration-specifier-asts (dictionary key)
  (gethash key dictionary))

(defun remove-declaration-specifier-asts (dictionary key)
  (remhash key dictionary))

(defgeneric add-dictionary-entry
    (dictionary reference declaration-specifier-ast))

(defmethod add-dictionary-entry
    (dictionary (reference null) declaration-specifier-ast)
  (add-entry dictionary nil declaration-specifier-ast))

(defmethod add-dictionary-entry
    (dictionary (reference symbol) declaration-specifier-ast)
  (add-entry dictionary reference declaration-specifier-ast))

(defmethod add-dictionary-entry
    (dictionary
     (reference ico:special-variable-reference-ast)
     declaration-specifier-ast)
  (add-dictionary-entry
   dictionary (ico:name reference) declaration-specifier-ast))

(defmethod add-dictionary-entry
    (dictionary
     (reference ico:variable-definition-ast)
     declaration-specifier-ast)
  (let ((definition (ico:variable-definition-ast reference)))
    (add-entry dictionary definition declaration-specifier-ast)))

(defmethod add-dictionary-entry
    (dictionary
     (reference ico:function-reference-ast)
     declaration-specifier-ast)
  (let ((definition (ico:definition-ast reference)))
    (add-entry dictionary definition declaration-specifier-ast)))

(defmethod add-dictionary-entry
    (dictionary
     (reference ico:global-function-name-reference-ast)
     declaration-specifier-ast)
  (let ((name (ico:name reference)))
    (add-entry dictionary `(function ,name) declaration-specifier-ast)))
  
(defgeneric add-dictionary-entries (dictionary declaration-specifier-ast))

(defmethod add-dictionary-entries
    (dictionary (ast ico:restricting-declaration-specifier-ast))
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
        do (add-dictionary-entry
            dictionary name-ast declaration-specifier-ast)))

(defmethod add-dictionary-entries
    (dictionary (ast ico:type-or-ftype-ast))
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
        do (add-dictionary-entry
            dictionary name-ast declaration-specifier-ast)))

(defun create-declaration-dictionary (declaration-asts)
  (loop with dictionary = (make-hash-table :test #'equal)
        for declaration-ast in declaration-asts
        do (loop for declaration-specifier-ast
                   in (ico:declaration-specifier-asts declaration-ast)
                 do (add-dictionary-entries
                     dictionary declaration-specifier-ast))
        finally (return dictionary)))
