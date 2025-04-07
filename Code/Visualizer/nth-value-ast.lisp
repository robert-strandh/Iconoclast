(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:nth-value-ast))
  (draw-ast ast "nth-value")
  (with-indentation (20)
    (display-ast (ico:n-ast ast))
    (display-ast (ico:form-ast ast))))
