(cl:in-package #:iconoclast-ast-transformations)

(defgeneric parents (ast-info))

(defgeneric owners (ast-info))

(defgeneric escaped-functions (ast-info))

(defgeneric (setf escaped-functions) (escaped-functions ast-info))

(defgeneric function-tree (ast-info))

(defgeneric nodes (ast-info))

(defgeneric node-table (ast-info))

(defclass ast-info ()
  ((%parents
    :initform (make-hash-table :test #'eq)
    :reader parents)
   (%owners
    :initform (make-hash-table :test #'eq)
    :reader owners)
   (%escaped-functions
    :initform '()
    :accessor escaped-functions)
   (%function-tree
    :reader function-tree)
   (%nodes :initform '() :accessor nodes)
   (%node-table :initarg node-table :reader node-table))

(defun parent (ast ast-info)
  (gethash ast (parents ast-info)))

(defun owner (ast ast-info)
  (gethash ast (owners ast-info)))

(defun function-escapes-p (local-function-ast ast-info)
  (check-type local-function-ast ico:local-function-ast)
  (member local-function-ast (escaped-functions ast-info) :test #'eq))
