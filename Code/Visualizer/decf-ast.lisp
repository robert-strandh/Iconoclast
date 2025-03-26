(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:decf-ast))
  (draw-ast ast "decf")
  (with-indentation (20)
    (display-ast (ico:place-ast ast)))
  (with-indentation (30)
    (display-ast (ico:delta-ast ast))))
