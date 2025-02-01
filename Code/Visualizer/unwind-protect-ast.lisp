(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:unwind-protect-ast) pane hpos vpos)
  (let* ((name "unwind-protect")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setq child-vpos
            (display-ast* (ico:protected-form-ast ast)
                          pane (+ hpos 30) (+ vpos 30)))
      (setq child-vpos
            (display-asts (ico:form-asts ast) pane (+ hpos 20) child-vpos))
      child-vpos)))
