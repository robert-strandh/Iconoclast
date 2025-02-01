(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:if-ast) pane hpos vpos)
  (let* ((name "if")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-ast* (ico:test-ast ast) pane
                          (+ hpos width 20)
                          child-vpos))
      (setf child-vpos
            (display-ast* (ico:then-ast ast) pane
                          (+ hpos width 20)
                          child-vpos))
      (unless (null (ico:else-ast ast))
        (setf child-vpos
              (display-ast* (ico:else-ast ast) pane
                            (+ hpos width 10)
                            child-vpos)))
      child-vpos)))
