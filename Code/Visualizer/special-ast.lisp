(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:special-ast) pane hpos vpos)
  (let* ((name "special")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-asts* (ico:name-asts ast)
                           pane (+ hpos width 10) child-vpos))
      child-vpos)))
