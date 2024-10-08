(cl:in-package #:iconoclast-ast-transformations)

;;; For some transformations, we need to compute a function tree
;;; corresponding to the nesting of local functions introduced by
;;; LABELS-ASTs.

(defvar *parent-node*)

(defclass function-tree-client (client)
  (;; This table maps LOCAL-FUNCTION-ASTs to nodes.
   (%node-table :initform (make-hash-table :test #'eq)
                :reader node-table)
   ;; This slot contains the root node of the function tree.
   (%function-tree-root :initform *parent-node* :reader function-tree-node)))

(defmethod iaw:walk-ast-node :around
    ((client function-tree-client) (ast ico:local-function-ast))
  (let ((node (make-instance 'function-node
                :node-function ast
                :parent-node *parent-node*)))
    (push node (child-nodes *parent-node*))
    (setf (gethash ast (node-table client)) node)
    (let ((*parent-node* node))
      (call-next-method))))

(defun compute-function-tree (ast ast-info)
  (let* ((*parent-node* (make-instance 'function-node
                          :node-function nil
                          :parent-node nil))
         (client (make-instance 'function-tree-client)))
    (iaw:walk-ast client ast)
    client))
