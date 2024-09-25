(cl:in-package #:iconoclast-ast-transformations)

;;; Some transformations will require us to know the owner of some
;;; AST.  This transformation assumes that the only construct that
;;; introduces a lexical variable is the LOCAL-FUNCTION-AST of a
;;; LABELS-AST.  The owner of an AST is the innermost
;;; LOCAL-FUNCTION-AST that the AST is properly contained in.  The
;;; owner of an AST might be NIL if it is not properly contained
;;; inside a LOCAL-FUNCTION-AST.

(defclass ast-owners-client (client)
  ((%owner-table :initform (make-hash-table :test #'eq)
                 :reader owner-table)))

(defvar *owner*)

;;; This method is used when AST is any AST class.
(defmethod iaw:walk-ast-node :around ((client ast-owners-client) ast)
  (setf (gethash ast (owner-table client)) *owner*)
  (call-next-method))

(defmethod iaw:walk-ast-node :around
    ((client ast-owners-client) (ast ico:local-function-ast))
  (setf (gethash ast (owner-table client)) *owner*)
  (let ((*owner* ast))
    (call-next-method)))

(defun compute-owners (ast)
  (let ((client (make-instance 'ast-owners-client))
        (*owner* nil))
    (iaw:walk-ast client ast)
    client))

(defun owner (ast ast-owners)
  (gethash ast (owner-table ast-owners)))
