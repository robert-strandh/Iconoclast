(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:multiple-value-list-ast))
  (draw-ast ast "multiple-value-list")
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
