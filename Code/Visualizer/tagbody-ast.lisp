(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:tagbody-ast))
  (draw-ast ast "tagbody")
  (with-indentation (20)
    (display-asts (ico:segment-asts ast))))
