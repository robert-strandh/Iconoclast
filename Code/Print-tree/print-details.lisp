(cl:in-package #:iconoclast-print-tree)

(defmethod print-details progn
    (stream deptn (node iconoclast-builder:unparsed-form-ast))
  (format stream "Form: ~S~@:_" (iconoclast-builder:form node)))

(defmethod print-details progn (stream depth (node ico:name-mixin))
  (format stream "~a~@:_" (ico:name node)))

(defmethod print-details progn (stream depth (node ico:name-ast))
  (format stream "Name: ~a~@:_" (ico:name node)))

(defmethod print-details progn (stream depth (node ico:optimize-quality-ast))
  (format stream "Name: ~a~@:_" (ico:value node)))
