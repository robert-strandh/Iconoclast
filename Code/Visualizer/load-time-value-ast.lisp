(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:load-time-value-ast) pane hpos vpos)
  (let* ((name "load-time-value")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-ast* (ico:form-ast ast) pane
                          (+ hpos width 20)
                          child-vpos))
      (+ child-vpos height 10))))
