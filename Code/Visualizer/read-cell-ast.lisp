(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:read-cell-ast))
  (draw-ast ast "read-cell")
  (with-indentation (20)
    (display-ast (ico:cell-ast ast))))
