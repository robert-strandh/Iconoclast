(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:ignore-ast))
  (draw-ast ast "ignore")
  (with-indentation (20)
    (display-asts (ico:name-asts ast))))

(defmethod display-ast ((ast ico:ignorable-ast))
  (draw-ast ast "ignorable")
  (with-indentation (20)
    (display-asts (ico:name-asts ast))))
