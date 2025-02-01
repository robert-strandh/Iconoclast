(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:the-ast) pane hpos vpos)
  (let* ((name "the")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setq child-vpos
            (display-ast* (ico:value-type-ast ast) pane (+ hpos 20) vpos))
      (setq child-vpos
            (display-ast* (ico:form-ast ast) pane (+ hpos 20) vpos))
      child-vpos)))
