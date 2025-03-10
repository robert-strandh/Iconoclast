(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:function-ast) pane hpos vpos)
  (let* ((name "function")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-ast* (ico:name-ast ast) pane
                          (+ hpos width 20)
                          child-vpos))
      child-vpos)))
