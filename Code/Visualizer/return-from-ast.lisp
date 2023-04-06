(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:return-from-ast) pane hpos vpos)
  (let* ((name "return-from")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (+ (display-ast* (ico:name-ast ast) pane
                             (+ hpos width 20)
                             child-vpos)
               10))
      (unless (null (ico:form-ast ast))
        (setf child-vpos
              (+ (display-ast* (ico:form-ast ast) pane
                               (+ hpos width 10)
                               child-vpos)
                 10)))
      (+ child-vpos height))))
