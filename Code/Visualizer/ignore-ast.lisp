(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:ignore-ast) pane hpos vpos)
  (display-simple-declaration-ast ast "ignore" pane hpos vpos))

(defmethod display-ast* ((ast ico:ignorable-ast) pane hpos vpos)
  (display-simple-declaration-ast ast "ignorable" pane hpos vpos))
