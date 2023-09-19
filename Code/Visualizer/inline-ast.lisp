(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:inline-ast) pane hpos vpos)
  (let* ((name "inline")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-asts (ico:name-asts ast)
                          pane (+ hpos width 10) child-vpos))
      (+ child-vpos height 10))))

(defmethod display-ast* ((ast ico:notinline-ast) pane hpos vpos)
  (let* ((name "notinline")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-asts (ico:name-asts ast)
                          pane (+ hpos width 10) child-vpos))
      (+ child-vpos height 10))))
