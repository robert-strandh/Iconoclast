(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:incf-ast))
  (draw-ast ast "incf")
  (with-indentation (20)
    (display-ast (ico:place-ast ast)))
  (with-indentation (30)
    (display-ast (ico:delta-ast ast))))
