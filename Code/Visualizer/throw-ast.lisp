(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:throw-ast))
  (draw-ast ast "throw")
  (with-indentation (40)
    (display-ast (ico:tag-form-ast ast)))
  (with-indentation (20)
    (display-ast (ico:form-ast ast))))
