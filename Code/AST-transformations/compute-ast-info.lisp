(cl:in-package #:iconoclast-ast-transformations)

(defun compute-ast-info (ast)
  (let ((ast-info (make-instance 'ast-info)))
    (compute-parent-asts ast ast-info)
    (compute-owners ast ast-info)
    (compute-function-tree ast ast-info)
    (compute-escaped-functions ast ast-info)
    (compute-call-graph ast ast-info)
    ast-info))
