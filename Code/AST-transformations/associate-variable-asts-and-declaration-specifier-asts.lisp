(cl:in-package #:iconoclast-ast-transformations)

;;; Given the list of VARIABLE-ASTs (each of which can be either a
;;; VARIABLE-DEFINITION-AST or a SPECIAL-VARIABLE-BOUND-AST) and a
;;; list of pairs (<variable-ast> . <declaration-specifier-ast>) where
;;; the <variable-ast> is either a VARIABLE-REFERENCE-AST or a
;;; SPECIAL-VARIABLE-REFERENCE-AST, return two values.  The first
;;; value is a list with the same length as the list of VARIABLE-ASTs
;;; given as argument.  Each element of that list corresponds to an
;;; element in the list of VARIABLE-ASTs given as input, in that it
;;; contains a list of DECLARATION-SPECIFIER-ASTs that refer to the
;;; corresponding variable.  The second return value is a list of all
;;; the DECLARATION-SPECIFIER-ASTs that refer to none of the variables
;;; in the list of VARIABLE-ASTs.  

(defun variable-asts-are-associated-p (ast1 ast2)
  (if (typep ast1 'ico:special-variable-bound-ast)
      (and (typep ast2 'ico:special-variable-reference-ast)
           (eq (ico:name (ico:name-ast ast1))
               (ico:name (ico:name-ast ast2))))
      (and (typep ast2 'ico:variable-reference-ast)
           (eq (ico:definition-ast ast2) ast1))))

(defun collect-associated-declaration-specifier-asts
    (variable-ast declaration-specifier-ast-pairs)
  (values (mapcar #'cdr 
                  (remove variable-ast declaration-specifier-ast-pairs
                          :key #'car
                          :test-not #'variable-asts-are-associated-p))
          (remove variable-ast declaration-specifier-ast-pairs
                          :key #'car
                          :test #'variable-asts-are-associated-p)))

(defun associate-variable-asts-and-declaration-specifier-asts
    (variable-asts declaration-specifier-ast-pairs)
  (let ((remaining declaration-specifier-ast-pairs))
    (values 
     (loop for variable-ast in variable-asts
           collect
           (multiple-value-bind (declaration-specifier-asts rest)
               (collect-associated-declaration-specifier-asts
                variable-ast remaining)
             (setf remaining rest)
             declaration-specifier-asts))
     (mapcar #'cdr remaining))))
