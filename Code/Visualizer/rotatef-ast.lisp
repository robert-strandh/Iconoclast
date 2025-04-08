(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:rotatef-ast))
  (draw-ast ast "rotatef")
  (with-indentation (20)
    (display-asts (ico:place-asts ast))))
