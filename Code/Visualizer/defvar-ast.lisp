(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:defvar-ast))
  (draw-ast ast "defvar")
  (with-indentation (20)
    (display-ast (ico:variable-name-ast ast))
    (display-ast (ico:form-ast ast))))
