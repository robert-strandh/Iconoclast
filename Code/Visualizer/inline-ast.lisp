(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:inline-ast))
  (draw-ast ast "inline")
  (with-indentation (20)
    (display-asts (ico:name-asts ast))))

(defmethod display-ast ((ast ico:notinline-ast))
  (draw-ast ast "notinline")
  (with-indentation (20)
    (display-asts (ico:name-asts ast))))
