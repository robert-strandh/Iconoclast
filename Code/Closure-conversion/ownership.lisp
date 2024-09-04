(cl:in-package #:iconoclast-closure-conversion)

(defclass ownership-client () ())

(defvar *current-function-ast*)

(defvar *ownership-table*)

(defmethod aw:walk-ast-node :around
    ((client ownership-client) (ast ico:local-function-ast))
  (let ((*current-function-ast* ast))
    (call-next-method)))

(defmethod aw:walk-ast-node :around
    ((client ownership-client) (ast ico:variable-definition-ast))
  (setf (gethash ast *ownership-table*) *current-function-ast*))

(defmethod aw:walk-ast-node :around
    ((client ownership-client) (ast ico:variable-reference-ast))
  (setf (gethash ast *ownership-table*) *current-function-ast*))

(defun compute-ownership (ast)
  (let ((*current-function-ast* nil)
        (*ownership-table* (make-hash-table :test #'eq))
        (client (make-instance 'ownership-client)))
    (aw:walk-ast client ast)
    *ownership-table*))
