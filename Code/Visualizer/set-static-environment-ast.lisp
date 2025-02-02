(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:set-static-environment-ast) pane hpos vpos)
  (let* ((name "set-static-environment")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-ast* (ico:function-reference-ast ast) pane
                          (+ hpos width 20)
                          child-vpos))
      (setf child-vpos
            (display-asts (ico:form-asts ast)
                          pane (+ hpos width 10) child-vpos))
      child-vpos)))
