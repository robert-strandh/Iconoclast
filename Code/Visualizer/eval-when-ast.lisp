(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:eval-when-ast) pane hpos vpos)
  (let* ((name "eval-when")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (loop for variable-binding-ast in (ico:situation-asts ast)
            do (setf child-vpos
                     (+ (display-ast* variable-binding-ast pane
                                      (+ hpos width 20)
                                      child-vpos)
                        10)))
      (loop for form-ast in (ico:form-asts ast)
            do (setf child-vpos
                     (+ (display-ast* form-ast pane
                                      (+ hpos width 10)
                                      child-vpos)
                        10)))
      (+ child-vpos height))))
