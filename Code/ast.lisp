(cl:in-package #:iconoclast)

;;;; The AST is a very close representation of the source code, except
;;;; that the environment is no longer present, so that there are no
;;;; longer any different namespaces for functions and variables.  And
;;;; of course, operations such as MACROLET are not present because
;;;; they only alter the environment.

;;; The base class for all ASTs.
(defclass ast ()
  ((%origin :initarg :origin :initform nil :reader origin)))
