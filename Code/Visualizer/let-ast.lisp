(cl:in-package #:iconoclast-visualizer)

(defun display-let-or-let* (name ast pane hpos vpos)
  (let* ((width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (incf child-vpos
            (display-asts (ico:binding-asts ast)
                          pane (+ hpos width 20) child-vpos))
      (incf child-vpos
            (display-asts (ico:declaration-asts ast)
                          pane (+ hpos width 15) child-vpos))
      (incf child-vpos
            (display-asts (ico:form-asts ast)
                          pane (+ hpos width 10) child-vpos))
      (+ child-vpos height 10))))

(defmethod display-ast* ((ast ico:let-ast) pane hpos vpos)
  (display-let-or-let* "let" ast pane hpos vpos))

(defmethod display-ast* ((ast ico:let*-ast) pane hpos vpos)
  (display-let-or-let* "let*" ast pane hpos vpos))
