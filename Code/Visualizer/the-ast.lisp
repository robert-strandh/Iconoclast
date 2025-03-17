(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:the-ast))
  (draw-ast ast "the")
  (with-indentation (40)
    (display-ast (ico:value-type-ast ast)))
  (with-indentation (20)
    (display-ast (ico:form-ast ast))))
