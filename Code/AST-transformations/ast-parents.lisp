(cl:in-package #:iconoclast-ast-transformations)

;;; Some transformations will require us to know the parent of some
;;; AST.  The AST tree is (almost) a tree, in that each AST has a
;;; unique parent, or no parent for the root AST.  For example, each
;;; reference to a lexical variable has its own AST, so there is no
;;; sharing there.  It is only almost a tree, because references and
;;; definitions of variables, functions, blocks, and tagbody tags are
;;; linked together.  However, the AST walker ignores such links, so
;;; as far as the walker is concerned, we have a tree.

(defclass parent-asts-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)))

(defvar *parent*)

(defmethod iaw:walk-ast-node :around ((client parent-asts-client) ast)
  (setf (parent ast (ast-info client)) *parent*)
  (let ((*parent* ast))
    (call-next-method)))

(defun compute-parent-asts (ast ast-info)
  (let ((client (make-instance 'parent-asts-client :ast-info ast-info))
        (*parent* nil))
    (iaw:walk-ast client ast)
    client))
