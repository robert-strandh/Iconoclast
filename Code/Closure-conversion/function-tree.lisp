(cl:in-package #:iconoclast-closure-conversion)

(defgeneric function-ast (tree-node))

(defgeneric children (tree-node))

(defclass tree-node ()
  ((%function-ast
    :initform '()
    :initarg :function-ast
    :reader function-ast)
   (%children
    :initform '()
    :accessor children)))

(defclass tree-node-client () ())

(defvar *current-node*)

(defmethod aw:walk-ast-node :around
    ((client tree-node-client) (ast ico:local-function-ast))
  (let ((new-node (make-instance 'tree-node :function-ast ast)))
    (push new-node (children *current-node*))
    (let ((*current-node* new-node))
      (call-next-method))))

(defun compute-function-tree (ast)
  (let ((*current-node* (make-instance 'tree-node))
        (client (make-instance 'tree-node-client)))
    (aw:walk-ast client ast)
    *current-node*))
