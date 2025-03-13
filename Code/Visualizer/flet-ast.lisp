(cl:in-package #:iconoclast-visualizer)

(defun display-flet-or-labels-or-macrolet (name ast)
  (draw-ast ast name)
  (with-child-asts (20 20)
    (display-asts (ico:binding-asts ast))
    (display-asts (ico:declaration-asts ast))
    (display-asts (ico:form-asts ast))))

(defmethod display-ast ((ast ico:flet-ast))
  (display-flet-or-labels-or-macrolet "flet" ast))

(defmethod display-ast ((ast ico:labels-ast))
  (display-flet-or-labels-or-macrolet "labels" ast))

(defmethod display-ast ((ast ico:macrolet-ast))
  (display-flet-or-labels-or-macrolet "macrolet" ast))
