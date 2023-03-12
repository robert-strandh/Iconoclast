(cl:in-package #:iconoclast-print-tree)

(defmethod children ((ast ico:block-ast))
  (list (cons "name-ast" (ico:name-ast ast))
        (cons "form-asts" (ico:form-asts ast))))

;;; FIXME: move this one?
(defmethod children ((ast ico:name-ast))
  '())
