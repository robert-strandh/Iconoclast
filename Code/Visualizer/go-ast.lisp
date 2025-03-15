(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:go-ast))
  (draw-ast ast "go")
  (with-indentation (20)
    (display-ast (ico:tag-ast ast))))
