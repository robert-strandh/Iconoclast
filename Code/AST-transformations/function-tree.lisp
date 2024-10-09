(cl:in-package #:iconoclast-ast-transformations)

;;; For some transformations, we need to compute a function tree
;;; corresponding to the nesting of local functions introduced by
;;; LABELS-ASTs.

(defvar *parent-function-ast*)

(defclass function-tree-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)))

(defmethod iaw:walk-ast-node :around
    ((client function-tree-client) (ast ico:local-function-ast))
  (let ((ast-info (ast-info client)))
    (setf (function-parent-ast ast ast-info) *parent-function-ast*)
    (push ast (function-child-asts *parent-function-ast* ast-info))
    (let ((*parent-function-ast* ast))
      (call-next-method))))

(defun compute-function-tree (ast ast-info)
  (let* ((*parent-function-ast* nil)
         (client (make-instance 'function-tree-client :ast-info ast-info)))
    (iaw:walk-ast client ast)
    client))
