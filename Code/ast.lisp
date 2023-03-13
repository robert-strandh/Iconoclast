(cl:in-package #:iconoclast)

;;;; The AST is a very close representation of the source code, except
;;;; that the environment is no longer present, so that there are no
;;;; longer any different namespaces for functions and variables.  And
;;;; of course, operations such as MACROLET are not present because
;;;; they only alter the environment.

(defgeneric origin (ast))

;;; The base class for all ASTs.
(defclass ast ()
  ((%origin :initarg :origin :initform nil :reader origin)))

;;; This generic function returns a list of pairs.  The CAR of each
;;; pair is a string that names the child in question, and the CDR is
;;; the child AST.  We use the APPEND method combination so that each
;;; class supplies a method that returns a list of only the children
;;; that that class contributes.
(defgeneric children (ast)
  (:method-combination append :most-specific-last))

;;; The default method returns the empty list.
(defmethod children append (ast)
  '())

(defmethod children append ((node cons))
  (loop for element in node
        collect (cons "" element)))
