(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:name-ast) pane hpos vpos)
  (let* ((name (symbol-name (ico:name ast)))
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (+ vpos height 10)))
