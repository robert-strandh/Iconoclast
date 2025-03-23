(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:unless-ast))
  (draw-ast ast "unless")
  (with-indentation (40)
    (display-ast (ico:test-ast ast)))
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
