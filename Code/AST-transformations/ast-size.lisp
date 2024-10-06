(cl:in-package #:iconoclast-ast-transformations)

(defclass ast-size-client (client)
  ((%ast-node-count :initform 0 :accessor ast-node-count)))

(defmethod iaw:walk-ast-node :around ((client ast-size-client) ast)
  (incf (ast-node-count client))
  (call-next-method)
  ast)

(defun ast-size (ast)
  (let ((client (make-instance 'ast-size-client)))
    (iaw:walk-ast client ast)
    (ast-node-count client)))
