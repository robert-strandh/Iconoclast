(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:push-ast))
  (draw-ast ast "push")
  (with-indentation (30)
    (display-ast (ico:item-ast ast)))
  (with-indentation (20)
    (display-ast (ico:place-ast ast))))
