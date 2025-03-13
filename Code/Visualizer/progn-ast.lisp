(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:progn-ast))
  (let* ((name "progn")
         (height 20))
    (draw-ast ast name)
    (with-child-asts ((+ height 10) 10)
      (display-asts (ico:form-asts ast)))))

(defmethod display-ast* ((ast ico:progn-ast) pane hpos vpos)
  (let* ((name "progn")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-asts* (ico:form-asts ast)
                           pane (+ hpos width 10) child-vpos))
      child-vpos)))
