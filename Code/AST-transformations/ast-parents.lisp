(cl:in-package #:iconoclast-ast-transformations)

;;; Some transformations will require us to know the parent of some
;;; AST.  The AST tree is (almost) a tree, in that each AST has a
;;; unique parent, or no parent for the root AST.  For example, each
;;; reference to a lexical variable has its own AST, so there is no
;;; sharing there.  It is only almost a tree, because references and
;;; definitions of variables, functions, blocks, and tagbody tags are
;;; linked together.  However, the AST walker ignores such links, so
;;; as far as the walker is concerned, we have a tree.

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
