(cl:in-package #:iconoclast-ast-transformations)

(defgeneric parent-asts (ast-info))

(defgeneric owner-asts (ast-info))

(defgeneric escaped-functions (ast-info))

(defgeneric (setf escaped-functions) (escaped-functions ast-info))

(defgeneric nodes (ast-info))

(defgeneric function-ast-nodes (ast-info))

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
   ;; This slot contains the list of nodes of the call graph.  Each
   ;; element is an instance of the NODE class defined above.
   (%nodes :initform '() :accessor nodes)
   ;; This slot contains a hash table that maps each
   ;; LOCAL-FUNCTION-AST to a node that represents it.
   (%function-ast-nodes
    :initform (make-hash-table :test #'eq)
    :reader function-ast-nodes)))

(defun parent-ast (ast ast-info)
  (gethash ast (parent-asts ast-info)))

(defun (setf parent-ast) (parent-ast ast ast-info)
  (setf (gethash ast (parent-asts ast-info)) parent-ast))

(defun owner-ast (ast ast-info)
  (multiple-value-bind (value presentp)
      (gethash ast (owner-asts ast-info))
    (assert presentp)
    value))

(defun (setf owner-ast) (owner-ast ast ast-info)
  (setf (gethash ast (owner-asts ast-info)) owner-ast))

(defun function-escapes-p (local-function-ast ast-info)
  (check-type local-function-ast ico:local-function-ast)
  (member local-function-ast (escaped-functions ast-info) :test #'eq))

(defclass function-ast-node ()
  ((%parent-function-ast
    :initarg :parent-function-ast
    :accessor parent-function-ast)
   (%child-function-asts
    :initform '()
    :accessor child-function-asts)
   (%caller-function-asts
    :initform '()
    :accessor caller-function-asts)
   (%callee-function-asts
    :initform '()
    :accessor callee-function-asts)))

(defun ensure-function-ast-node (local-function-ast ast-info)
  (let ((node (gethash local-function-ast (function-ast-nodes ast-info))))
    (if (null node)
        (setf (gethash local-function-ast (function-ast-nodes ast-info))
              (make-instance 'function-ast-node))
        node)))

(defun function-parent-ast (local-function-ast ast-info)
  (let ((node (ensure-function-ast-node local-function-ast ast-info)))
    (parent-function-ast node)))

(defun link-parent-and-child-function (parent-ast child-ast ast-info)
  (let ((parent-node (ensure-function-ast-node parent-ast ast-info))
        (child-node (ensure-function-ast-node child-ast ast-info)))
    (setf (parent-function-ast child-node) parent-ast)
    (push child-ast (child-function-asts parent-node))))

(defun function-child-asts (local-function-ast ast-info)
  (let ((node (ensure-function-ast-node local-function-ast ast-info)))
    (child-function-asts node)))

(defun function-caller-asts (local-function-ast ast-info)
  (let ((node (ensure-function-ast-node local-function-ast ast-info)))
    (caller-function-asts node)))

(defun (setf function-caller-asts)
    (function-caller-asts local-function-ast ast-info)
  (let ((node (ensure-function-ast-node local-function-ast ast-info)))
    (setf (caller-function-asts node) function-caller-asts)))

(defun function-callee-asts (local-function-ast ast-info)
  (let ((node (ensure-function-ast-node local-function-ast ast-info)))
    (callee-function-asts node)))

(defun (setf function-callee-asts)
    (function-callee-asts local-function-ast ast-info)
  (let ((node (ensure-function-ast-node local-function-ast ast-info)))
    (setf (callee-function-asts node) function-callee-asts)))
