(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:tagbody-with-variable-ast))
  (draw-ast ast "tagbody-with-variable")
  (with-indentation (40)
    (display-ast (ico:variable-definition-ast ast)))
  (with-indentation (20)
    (display-asts (ico:segment-asts ast))))
