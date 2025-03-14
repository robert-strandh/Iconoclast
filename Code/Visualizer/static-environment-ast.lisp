(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:static-environment-ast))
  (draw-ast ast "static-environment"))
