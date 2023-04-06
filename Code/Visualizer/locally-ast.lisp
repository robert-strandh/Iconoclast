(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:locally-ast) pane hpos vpos)
  (let* ((name "locally")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (loop for declaration-ast in (ico:declaration-asts ast)
            do (setf child-vpos
                     (+ (display-ast* declaration-ast pane
                                      (+ hpos width 15)
                                      child-vpos)
                        10)))
      (loop for form-ast in (ico:form-asts ast)
            do (setf child-vpos
                     (+ (display-ast* form-ast pane
                                      (+ hpos width 10)
                                      child-vpos)
                        10)))
      (+ child-vpos height))))
