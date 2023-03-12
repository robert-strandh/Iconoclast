(cl:in-package #:iconoclast-print-tree)

(defmethod children ((ast ico:block-ast))
  (cons (ico:name-ast ast) (ico:form-asts ast)))

;;; FIXME: move this one?
(defmethod children ((ast ico:name-ast))
  '())
