(cl:in-package #:iconoclast-print-tree)

(defmethod print-details (stream depth (node ico:name-ast))
  (format stream "Name: ~a~@:_" (ico:name node)))
