(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:or-ast))
  (draw-ast ast "or")
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
