(cl:in-package #:iconoclast-print-tree)

(defmethod print-details (stream depth (node ico:tag-ast))
  (format stream "Tag: ~a~@:_" (ico:tag node)))
