(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:tagbody-segment-ast))
  (draw-ast ast "tagbody-segment")
  (with-indentation (10)
    (display-ast (ico:tag-ast ast)))
  (with-indentation (20)
    (display-asts (ico:statement-asts ast))))
