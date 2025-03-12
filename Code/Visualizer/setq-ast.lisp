(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:setq-ast) pane hpos vpos)
  (let* ((name "setq")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (loop for variable-name-ast in (ico:variable-name-asts ast)
            for value-ast in (ico:value-asts ast)
            do (display-ast* variable-name-ast pane (+ hpos 30) vpos)
               (setq child-vpos
                     (display-ast* value-ast pane (+ hpos 60) vpos)))
      child-vpos)))
