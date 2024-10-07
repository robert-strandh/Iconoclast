(cl:in-package #:iconoclast-ast-transformations)

(defun compute-ast-info (ast)
  (let ((ast-info (make-instance 'ast-info)))
    (compute-parents ast ast-info)
    (compute-owners ast ast-info)
    (compute-escaped-functions ast ast-info)
    (compute-call-graph ast ast-info)
    ast-info))
