(cl:in-package #:iconoclast-ast-transformations)

(defun compute-ast-info (ast)
  (let ((ast-info (make-instance 'ast-info)))
    (compute-parent-asts ast ast-info)
    (compute-owner-asts ast ast-info)
    (compute-function-tree ast ast-info)
    (compute-escaped-functions ast ast-info)
    (compute-call-graph ast ast-info)
    ast-info))

(defclass check-ast-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)))

(defun check-definition-ast (definition-ast ast-info)
  (unless (null (owner-ast definition-ast ast-info))
    (loop for reference-ast in (ico:reference-asts definition-ast)
          for owner-ast = (owner-ast reference-ast ast-info)
          do (assert (not (null owner-ast))))))

(defmethod iaw:walk-ast-node :around
    ((client check-ast-client) (ast ico:variable-definition-ast))
  (call-next-method)
  (check-definition-ast ast (ast-info client))
  ast)

(defmethod iaw:walk-ast-node :around
    ((client check-ast-client) (ast ico:function-definition-ast))
  (call-next-method)
  (check-definition-ast ast (ast-info client))
  ast)

(defun check-ast (ast ast-info)
  (let ((client (make-instance 'check-ast-client :ast-info ast-info)))
    (iaw:walk-ast client ast)))

