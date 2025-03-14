(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:read-static-environment-ast))
  (draw-ast ast "read-static-environment")
  (with-indentation (20)
    (display-ast (ico:static-environment-ast ast))
    (display-ast (ico:index-ast ast))))
