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

(defclass function-node ()
  ((%node-function :initarg :node-function :reader node-function)
   (%parent-node :initarg :parent-node :reader parent-node)
   (%child-nodes :initform '() :accessor child-nodes)))

(defmethod iaw:walk-ast-node :around
    ((client ast-parents-client) (ast ico:local-function-ast))
  (let ((node (make-instance 'function-node
                :node-function ast
                :parent-node *parent-node*)))
    (push node (child-nodes *parent-node*))
    (setf (gethash ast (table client)) node)
    (let ((*parent-node* node))
      (call-next-method))))

(defun compute-function-tree (ast)
  (let* ((*parent-node* (make-instance 'function-node
                          :node-function nil
                          :parent-node nil))
         (client (make-instance 'function-tree-client)))
    (iaw:walk-ast client ast)
    client))

(defun function-node (ast function-tree)
  (gethash ast (node-table function-tree)))
