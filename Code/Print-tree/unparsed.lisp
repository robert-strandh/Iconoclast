(cl:in-package #:iconoclast-print-tree)

(defmethod children ((ast iconoclast-builder:unparsed-form-ast))
  '())

(defmethod print-details progn
    (stream deptn (node iconoclast-builder:unparsed-form-ast))
  (format stream "Form: ~S~@:_" (iconoclast-builder:form node)))
