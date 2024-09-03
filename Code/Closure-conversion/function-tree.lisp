(cl:in-package #:iconoclast-closure-conversion)

(defgeneric function-ast (tree-node))

(defgeneric children (tree-node))

(defclass tree-node ()
  ((%function-ast :initarg :function-ast :reader function-ast)
   (%children :initform '() :accessor children)))
