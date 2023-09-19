(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:inline-ast) pane hpos vpos)
  (display-simple-declaration-ast ast "inline" pane hpos vpos))

(defmethod display-ast* ((ast ico:notinline-ast) pane hpos vpos)
  (display-simple-declaration-ast ast "notinline" pane hpos vpos))
