(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast*
    ((ast ico:special-variable-binding-ast) pane hpos vpos)
  (let* ((name "binding")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-ast* (ico:variable-name-ast ast) pane
                          (+ hpos width 10)
                          child-vpos))
      (setf child-vpos
            (display-ast* (ico:form-ast ast) pane
                          (+ hpos width 10)
                          child-vpos))
      child-vpos)))

(defmethod display-ast* ((ast ico:special-variable-bind-ast) pane hpos vpos)
  (let* ((name "special-variable-bind")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-ast* (ico:binding-ast ast)
                          pane (+ hpos width 20) child-vpos))
      (setf child-vpos
            (display-asts* (ico:declaration-asts ast)
                           pane (+ hpos width 15) child-vpos))
      (setf child-vpos
            (display-asts* (ico:form-asts ast)
                           pane (+ hpos width 10) child-vpos))
      child-vpos)))
