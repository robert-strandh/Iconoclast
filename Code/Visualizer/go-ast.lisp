(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:go-ast) pane hpos vpos)
  (let* ((name "go")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-ast* (ico:tag-ast ast) pane
                          (+ hpos width 10)
                          child-vpos))
      child-vpos)))
