(cl:in-package #:iconoclast-ast-transformations)

;;; This function takes a DECLARATION-SPECIFIER-AST and splits it into
;;; a list of DECLARATION-SPECIFIER-ASTs of the same type, so that
;;; each DECLARATION-SPECIFIER-AST in the return value refers to a
;;; single variable.  This function returns a list of pairs
;;; (<variable-ast> . <declaration-specifier-ast>) such that
;;; <variable-ast> is the AST referred to by the
;;; <declaration-specifier-ast>.  <variable-ast> can be either a
;;; VARIABLE-REFERENCE-AST if the variable is lexical, or a
;;; SPECIAL-VARIABLE-REFERENCE-AST if the variable is special.
;;;
;;; If either the DECLARATION-SPECIFIER-AST argument is of a type that
;;; does not refer to variables at all, like OPTIMIZE or INLINE, or if
;;; it is of a type that does refer to variables, but there are no
;;; variables referred to, then the empty list is returned.

(defgeneric split-declaration-specifier-ast (declaration-specifier-ast))

;;; The default method returns the empty list.
(defmethod split-declaration-specifier-ast (declaration-specifier-ast)
  '())
                                            
