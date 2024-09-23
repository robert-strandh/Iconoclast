(cl:in-package #:iconoclast-ast-transformations)

;;; Some transformations will require us to know the parent of some
;;; AST.  The AST tree is really a tree, so each AST has a unique
;;; parment, or no parent for the root AST.  For example, each
;;; reference to a lexical variable has its own AST, so there is no
;;; sharing there.

(defclass ast-parents-client (client)
  ((%table :initform (make-hash-table :test #'eq)
           :reader table)))

(defvar *parent*)

(defmethod iaw:walk-ast-node :around ((client ast-parents-client) ast)
  (setf (gethash ast (table client)) *parent*)
  (let ((*parent* ast))
    (call-next-method)))

(defun compute-parents (ast)
  (let ((client (make-instance 'ast-parents-client))
        (*parent* nil))
    (iaw:walk-ast client ast)
    client))

(defun parent (ast ast-parents)
  (gethash ast (table ast-parents)))
