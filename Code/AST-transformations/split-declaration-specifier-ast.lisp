(cl:in-package #:iconoclast-ast-transformations)

;;; This function takes a DECLARATION-SPECIFIER-AST and return two
;;; lists as two return values.  Each element of first list is of the
;;; form (<variable-name-ast> . <declaration-specifier-ast>) such that
;;; <declaration-specifier-ast> is a DECLARATION-SPECIFIER-AST of the
;;; same type as the argument to this function, and it contains a
;;; single VARIABLE-NAME-AST that can be either a
;;; VARIABLE-REFERENCE-AST or a SPECIAL-VARIABLE-REFERENCE-AST
;;; according to whether the variable ls lexical or special.  The
;;; <variable-name-ast> is the same as the one contained in
;;; <declaration-specifier-ast>.  Each element of the second list is a
;;; DECLARATION-SPECIFIER-AST of the same type as the argument to this
;;; function, such that either the DECLARATION-SPECIFIER-AST does not
;;; refer to any names at all, or it refers to function names rather
;;; than variable names.

(defgeneric split-declaration-specifier-ast (declaration-specifier-ast))

(defmethod split-declaration-specifier-ast (ast)
  (values '() (list ast)))
                                            
(defun split-simple-declaration-specifier-ast (ast)
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
        if (typep name-ast 'ico:function-name-ast)
          collect declaration-specifier-ast into result2
        else
          collect (cons name-ast declaration-specifier-ast) into result1
        finally (return (values result1 result2))))

(defmethod split-declaration-specifier-ast ((ast ico:dynamic-extent-ast))
  (split-simple-declaration-specifier-ast ast))

(defmethod split-declaration-specifier-ast ((ast ico:ignore-ast))
  (split-simple-declaration-specifier-ast ast))

(defmethod split-declaration-specifier-ast ((ast ico:ignorable-ast))
  (split-simple-declaration-specifier-ast ast))

(defmethod split-declaration-specifier-ast ((ast ico:type-ast))
  (values (loop with type-specifier-ast = (ico:type-specifier-ast ast)
                with origin = (ico:origin ast)
                for name-ast in (ico:name-asts ast)
                collect (cons name-ast
                              (make-instance 'ico:type-ast
                                :type-specifier-ast type-specifier-ast
                                :name-ast name-ast
                                :origin origin)))
          '()))

(defmethod split-declaration-specifier-ast ((ast ico:special-ast))
  (values (loop with origin = (ico:origin ast)
                for name-ast in (ico:name-asts ast)
                collect (cons name-ast
                              (make-instance 'ico:special-ast
                                :name-ast name-ast
                                :origin origin)))
          '()))
