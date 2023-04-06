(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:progn-ast) pane hpos vpos)
  (let* ((name "progn")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (loop for child in (ico:form-asts ast)
            do (setf child-vpos
                     (display-ast* child pane
                                   (+ hpos width 10)
                                   child-vpos)))
      (+ child-vpos height))))
