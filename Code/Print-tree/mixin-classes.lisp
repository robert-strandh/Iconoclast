(cl:in-package #:iconoclast-print-tree)

(defmethod print-details progn (stream depth (node ico:name-mixin))
  (format stream "~a~@:_" (ico:name-ast node)))
