(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:write-cell-ast))
  (draw-ast ast "write-cell")
  (with-indentation (20)
    (display-ast (ico:cell-ast ast))
    (display-ast (ico:form-ast ast))))
