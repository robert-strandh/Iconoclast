(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:throw-ast) pane hpos vpos)
  (let* ((name "throw")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setq child-vpos
            (display-ast* (ico:tag-ast ast) pane (+ hpos 30) child-vpos))
      (setq child-vpos
            (display-ast* (ico:tag-ast ast) pane (+ hpos 20) child-vpos))
      child-vpos)))
