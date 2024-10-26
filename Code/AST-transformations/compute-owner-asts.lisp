(cl:in-package #:iconoclast-ast-transformations)

;;; Some transformations will require us to know the owner of some
;;; AST.  This transformation assumes that the only construct that
;;; introduces a lexical variable is the LOCAL-FUNCTION-AST of a
;;; LABELS-AST.  The owner of an AST is the innermost
;;; LOCAL-FUNCTION-AST that the AST is properly contained in.  The
;;; owner of an AST might be NIL if it is not properly contained
;;; inside a LOCAL-FUNCTION-AST.

(defclass owner-asts-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)))

(defvar *owner-ast*)

;;; This method is used when AST is any AST class.
(defmethod iaw:walk-ast-node :around ((client owner-asts-client) ast)
  (setf (owner-ast ast (ast-info client)) *owner-ast*)
  (call-next-method))

(defmethod iaw:walk-ast-node :around
    ((client owner-asts-client) (ast ico:local-function-ast))
  (let ((*owner-ast* ast))
    (call-next-method))
  (setf (owner-ast ast (ast-info client)) *owner-ast*)
  ast)

(defun compute-owner-asts (ast ast-info)
  (let ((client (make-instance 'owner-asts-client :ast-info ast-info))
        (*owner-ast* nil))
    (iaw:walk-ast client ast)
    client))
