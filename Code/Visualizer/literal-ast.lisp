(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:literal-ast) pane hpos vpos)
  (let* ((name (format nil "~s" (ico:literal ast)))
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (+ vpos height)))
