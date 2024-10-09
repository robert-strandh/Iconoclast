(cl:in-package #:iconoclast-ast-transformations)

;;; Some transformations will require us to know the owner of some
;;; AST.  This transformation assumes that the only construct that
;;; introduces a lexical variable is the LOCAL-FUNCTION-AST of a
;;; LABELS-AST.  The owner of an AST is the innermost
;;; LOCAL-FUNCTION-AST that the AST is properly contained in.  The
;;; owner of an AST might be NIL if it is not properly contained
;;; inside a LOCAL-FUNCTION-AST.

(defclass ast-owners-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)))


(defvar *owner*)

;;; This method is used when AST is any AST class.
(defmethod iaw:walk-ast-node :around ((client ast-owners-client) ast)
  (setf (owner ast (ast-info client)) *owner*)
  (call-next-method))

(defmethod iaw:walk-ast-node :around
    ((client ast-owners-client) (ast ico:local-function-ast))
  (let ((*owner* ast))
    (call-next-method))
  (setf (owner ast (ast-info client)) *owner*)
  ast)

(defun compute-owners (ast ast-info)
  (let ((client (make-instance 'ast-owners-client :ast-info ast-info))
        (*owner* nil))
    (iaw:walk-ast client ast)
    client))
