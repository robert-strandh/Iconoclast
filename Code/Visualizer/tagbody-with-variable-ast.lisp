(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast* ((ast ico:tagbody-segment-ast) pane hpos vpos)
  (let* ((name "segment")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos (+ vpos 30))
          (tag-ast (ico:tag-ast ast)))
      (unless (null tag-ast)
        (setf child-vpos
              (display-ast* tag-ast pane (+ hpos 20) child-vpos)))
      (setf child-vpos
            (display-asts*
             (ico:statement-asts ast) pane (+ hpos 30) child-vpos))
      child-vpos)))

(defmethod display-ast* ((ast ico:tagbody-with-variable-ast) pane hpos vpos)
  (let* ((name "tagbody-with-variable")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-ast* (ico:variable-definition-ast ast) pane
                          (+ hpos width 20)
                          child-vpos))
      (setf child-vpos 
            (display-asts* (ico:segment-asts ast)
                           pane (+ hpos 20) child-vpos))
      child-vpos)))
