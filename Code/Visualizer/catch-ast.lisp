(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:catch-ast))
  (draw-ast ast "catch")
  (with-indentation (40)
    (display-ast (ico:tag-form-ast ast)))
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
