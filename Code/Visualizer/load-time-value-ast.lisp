(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:load-time-value-ast))
  (draw-ast ast "load-time-value")
  (with-indentation (30)
    (display-ast (ico:read-only-p-ast ast)))
  (with-indentation (20)
    (display-ast (ico:form-ast ast))))
