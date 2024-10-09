(cl:in-package #:iconoclast-ast-transformations)

(defgeneric parent-asts (ast-info))

(defgeneric owner-asts (ast-info))

(defgeneric escaped-functions (ast-info))

(defgeneric (setf escaped-functions) (escaped-functions ast-info))

(defgeneric function-tree (ast-info))

(defgeneric nodes (ast-info))

(defgeneric node-table (ast-info))

(defclass ast-info ()
  ((%parent-asts
    :initform (make-hash-table :test #'eq)
    :reader parent-asts)
   (%owner-asts
    :initform (make-hash-table :test #'eq)
    :reader owner-asts)
   (%escaped-functions
    :initform '()
    :accessor escaped-functions)
   (%function-tree
    :reader function-tree)
   ;; This slot contains the list of nodes of the call graph.  Each
   ;; element is an instance of the NODE class defined above.
   (%nodes :initform '() :accessor nodes)
   ;; This slot contains a hash table that maps each
   ;; LOCAL-FUNCTION-AST to a node that represents it.
   (%node-table
    :initform (make-hash-table :test #'eq)
    :reader node-table)))

(defun parent-ast (ast ast-info)
  (gethash ast (parent-asts ast-info)))

(defun (setf parent-ast) (parent-ast ast ast-info)
  (setf (gethash ast (parent-asts ast-info)) parent-ast))

(defun owner (ast ast-info)
  (gethash ast (owner-asts ast-info)))

(defun (setf owner) (owner ast ast-info)
  (setf (gethash ast (owner-asts ast-info)) owner))

(defun function-escapes-p (local-function-ast ast-info)
  (check-type local-function-ast ico:local-function-ast)
  (member local-function-ast (escaped-functions ast-info) :test #'eq))

(defclass function-node ()
  ((%node-function :initarg :node-function :reader node-function)
   (%parent-node :initarg :parent-node :reader parent-node)
   (%child-nodes :initform '() :accessor child-nodes)))

(defun function-node (ast ast-info)
  (gethash ast (node-table ast-info)))

(defun function-parent (local-function-ast ast-info)
  (let* ((function-node (function-node local-function-ast ast-info))
         (parent-node (parent-node function-node)))
    (node-function parent-node)))
