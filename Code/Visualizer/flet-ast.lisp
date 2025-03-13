(cl:in-package #:iconoclast-visualizer)

(defun display-flet-or-labels-or-macrolet (name ast)
  (let* ((width (+ (string-width name) 10))
         (height 20))
    (draw-ast ast width height name)
    (with-child-asts (20 20)
      (display-asts (ico:binding-asts ast))
      (display-asts (ico:declaration-asts ast))
      (display-asts (ico:form-asts ast)))))

(defmethod display-ast ((ast ico:flet-ast))
  (display-flet-or-labels-or-macrolet "flet" ast))

(defmethod display-ast ((ast ico:labels-ast))
  (display-flet-or-labels-or-macrolet "labels" ast))

(defmethod display-ast ((ast ico:macrolet-ast))
  (display-flet-or-labels-or-macrolet "macrolet" ast))

(defun display-flet-or-labels (name ast pane hpos vpos)
  (let* ((width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-asts* (ico:binding-asts ast)
                           pane (+ hpos width 20) child-vpos))
      (setf child-vpos
            (display-asts* (ico:declaration-asts ast)
                           pane (+ hpos width 15) child-vpos))
      (setf child-vpos
            (display-asts* (ico:form-asts ast)
                           pane (+ hpos width 10) child-vpos))
      child-vpos)))

(defmethod display-ast* ((ast ico:flet-ast) pane hpos vpos)
  (display-flet-or-labels "flet" ast pane hpos vpos))

(defmethod display-ast* ((ast ico:labels-ast) pane hpos vpos)
  (display-flet-or-labels "labels*" ast pane hpos vpos))

(defmethod display-ast* ((ast ico:macrolet-ast) pane hpos vpos)
  (display-flet-or-labels "macrolet*" ast pane hpos vpos))
