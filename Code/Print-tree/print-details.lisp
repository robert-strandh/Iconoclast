(cl:in-package #:iconoclast-print-tree)

(defmethod print-details progn
    (stream deptn (node iconoclast-builder:unparsed-form-ast))
  (format stream "Form: ~S~@:_" (iconoclast-builder:form node)))

(defmethod print-details progn (stream depth (node ico:tag-ast))
  (format stream "Tag: ~a~@:_" (ico:tag node)))

(defmethod print-details progn (stream depth (node ico:name-mixin))
  (format stream "~a~@:_" (ico:name node)))
