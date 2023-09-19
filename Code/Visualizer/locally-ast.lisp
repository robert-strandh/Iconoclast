(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:locally-ast) pane hpos vpos)
  (let* ((name "locally")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-asts (ico:declaration-asts ast)
                          pane (+ hpos width 15) child-vpos))
      (setf child-vpos
            (display-asts (ico:form-asts ast)
                          pane (+ hpos width 10) child-vpos))
      child-vpos)))
