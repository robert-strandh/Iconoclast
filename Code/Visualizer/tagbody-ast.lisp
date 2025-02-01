(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:tagbody-segment-ast) pane hpos vpos)
  (let* ((name "segment")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos vpos)
          (tag-ast (ico:tag-ast ast)))
      (unless (null tag-ast)
        (setf child-vpos
              (display-ast* tag-ast pane (+ hpos 20) child-vpos)))
      (setf child-vpos
            (display-asts
             (ico:statement-asts ast) pane (+ hpos 30) child-vpos))
      child-vpos)))

(defmethod display-ast* ((ast ico:tagbody-ast) pane hpos vpos)
  (let* ((name "tagbody")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (display-asts (ico:segment-asts ast) pane (+ hpos 20) (+ vpos 20))))
