(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:and-ast))
  (draw-ast ast "and")
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
