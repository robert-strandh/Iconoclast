(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:pop-ast))
  (draw-ast ast "pop")
  (with-indentation (20)
    (display-ast (ico:place-ast ast))))
