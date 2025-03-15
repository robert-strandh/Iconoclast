(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:function-ast))
  (draw-ast ast "function")
  (with-indentation (20)
    (display-ast (ico:name-ast ast))))
