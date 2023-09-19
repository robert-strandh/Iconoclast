(cl:in-package #:iconoclast-visualizer)

(defun display-flet-or-labels (name ast pane hpos vpos)
  (let* ((width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-asts (ico:binding-asts ast)
                          pane (+ hpos width 20) child-vpos))
      (setf child-vpos
            (display-asts (ico:declaration-asts ast)
                          pane (+ hpos width 15) child-vpos))
      (setf child-vpos
            (display-asts (ico:form-asts ast)
                          pane (+ hpos width 10) child-vpos))
      child-vpos)))

(defmethod display-ast* ((ast ico:flet-ast) pane hpos vpos)
  (display-flet-or-labels "flet" ast pane hpos vpos))

(defmethod display-ast* ((ast ico:labels-ast) pane hpos vpos)
  (display-flet-or-labels "labels*" ast pane hpos vpos))

(defmethod display-ast* ((ast ico:macrolet-ast) pane hpos vpos)
  (display-flet-or-labels "macrolet*" ast pane hpos vpos))
